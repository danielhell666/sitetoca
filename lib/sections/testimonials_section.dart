import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../data/testimonials_data.dart';
import '../theme/app_colors.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final ScrollController _controller = ScrollController();
  bool _visible = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      if (!_controller.hasClients) return;

      final next = (_controller.offset + event.scrollDelta.dy)
          .clamp(0.0, _controller.position.maxScrollExtent);

      _controller.jumpTo(next);
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey('testimonials-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.18 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        opacity: _visible ? 1 : 0,
        child: LayoutBuilder(
          builder: (context, c) {
            final w = c.maxWidth;

            final double listHeight = w < 520
                ? 240
                : w < 820
                    ? 220
                    : 200;

            final Color cardColor = AppColors.secondary;

            final double cardWidth =
                w < 520 ? (w * 0.86).clamp(260.0, 360.0) : 340;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Depoimentos',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 6),
                const Text(
                  'O que as famílias dizem sobre o atendimento.',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textMuted,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 14),
                Listener(
                  onPointerSignal: _onPointerSignal,
                  child: Scrollbar(
                    controller: _controller,
                    thumbVisibility: w >= 820,
                    child: SizedBox(
                      height: listHeight,
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          scrollbars: false,
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                            PointerDeviceKind.trackpad,
                          },
                        ),
                        child: ListView.separated(
                          controller: _controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: testimonialsData.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (_, i) => _Card(
                            t: testimonialsData[i],
                            width: cardWidth,
                            color: cardColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final Testimonial t;
  final double width;
  final Color color;

  const _Card({
    required this.t,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE4ECE9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote_rounded, color: AppColors.primary),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              t.text,
              style: const TextStyle(
                height: 1.45,
                color: AppColors.textMuted,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            t.name,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}