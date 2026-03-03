import 'dart:async';
import 'package:flutter/material.dart';
import '../data/carousel_data.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final _controller = PageController();
  Timer? _timer;
  int _index = 0;
  bool _hovering = false;
  bool _didPrecache = false;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();

    // Precarrega algumas imagens após o 1º frame para reduzir travadinhas no Web.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _precacheCarouselImages(limit: 3);
    });
  }

Future<void> _precacheCarouselImages({int limit = 3}) async {
  if (_didPrecache) return;
  if (carouselItems.isEmpty) return;
  _didPrecache = true;

  final count = limit.clamp(0, carouselItems.length);

  for (var i = 0; i < count; i++) {
    await precacheImage(
      AssetImage(carouselItems[i].imageDesktop),
      context,
    );

    await precacheImage(
      AssetImage(carouselItems[i].imageMobile),
      context,
    );

    if (!mounted) return;
  }
}

  void _startAutoPlay() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_controller.hasClients) return;
      if (carouselItems.isEmpty) return;

      final next = (_index + 1) % carouselItems.length;

      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _stopAutoPlay() => _timer?.cancel();

  void _goPrev() {
    if (!_controller.hasClients) return;

    final prev =
        (_index - 1) < 0 ? (carouselItems.length - 1) : (_index - 1);

    _controller.animateToPage(
      prev,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOut,
    );
  }

  void _goNext() {
    if (!_controller.hasClients) return;

    final next = (_index + 1) % carouselItems.length;

    _controller.animateToPage(
      next,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _hovering = true);
        _stopAutoPlay();
      },
      onExit: (_) {
        setState(() => _hovering = false);
        _startAutoPlay();
      },
      child: Listener(
        onPointerDown: (_) => _stopAutoPlay(),
        onPointerUp: (_) => _startAutoPlay(),
        onPointerCancel: (_) => _startAutoPlay(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 700;

              return AspectRatio(
                aspectRatio: isMobile ? (4 / 5) : (16 / 6),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    PageView.builder(
                      controller: _controller,
                      itemCount: carouselItems.length,
                      onPageChanged: (i) => setState(() => _index = i),
                      itemBuilder: (_, i) {
                        final item = carouselItems[i];

                        // ✅ escolhe imagem por breakpoint
                        final imagePath =
                            isMobile ? item.imageMobile : item.imageDesktop;

                        // Reduz a quantidade de pixels decodificados na Web.
                        final dpr = MediaQuery.of(context).devicePixelRatio;
                        final cacheWidth =
                            (constraints.maxWidth * dpr).round().clamp(600, 2200);

                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Image(
                              image: ResizeImage(
                                AssetImage(imagePath),
                                width: cacheWidth,
                              ),
                              fit: BoxFit.cover,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.45),
                                    Colors.black.withOpacity(0.2),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 24,
                              right: 24,
                              bottom: 28,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 520),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      item.subtitle,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    // SETAS (desktop)
                    if (!isMobile)
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 180),
                        opacity: _hovering ? 1 : 0,
                        child: IgnorePointer(
                          ignoring: !_hovering,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 12,
                                top: 0,
                                bottom: 0,
                                child: _ArrowButton(
                                  icon: Icons.chevron_left_rounded,
                                  onTap: _goPrev,
                                ),
                              ),
                              Positioned(
                                right: 12,
                                top: 0,
                                bottom: 0,
                                child: _ArrowButton(
                                  icon: Icons.chevron_right_rounded,
                                  onTap: _goNext,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    // DOTS
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          carouselItems.length,
                          (i) => AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _index == i ? 18 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _index == i
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(99),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ArrowButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.82),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.35)),
          ),
          child: Icon(icon, size: 28, color: Colors.black87),
        ),
      ),
    );
  }
}