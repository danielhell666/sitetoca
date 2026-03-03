import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../data/team_data.dart';
import '../theme/app_colors.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = teamData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Equipe',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        const Text(
          'Profissionais preparados para acolher e conduzir cada etapa do desenvolvimento.',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textMuted,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 18),
        ...List.generate(items.length, (i) {
          final isEven = i % 2 == 0;

          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _TeamRow(
              person: items[i],
              imageOnLeft: isEven,
            ),
          );
        }),
      ],
    );
  }
}

class _TeamRow extends StatefulWidget {
  final TeamPerson person;
  final bool imageOnLeft;

  const _TeamRow({
    required this.person,
    required this.imageOnLeft,
  });

  @override
  State<_TeamRow> createState() => _TeamRowState();
}

class _TeamRowState extends State<_TeamRow> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final photo = _PhotoCard(
      person: widget.person,
    );

    final bio = _BioCard(
      person: widget.person,
    );

    return VisibilityDetector(
      key: ValueKey('team-${widget.person.id}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.18 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 450),
        opacity: _visible ? 1 : 0,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 450),
          offset: _visible
              ? Offset.zero
              : widget.imageOnLeft
                  ? const Offset(-0.08, 0)
                  : const Offset(0.08, 0),
          curve: Curves.easeOut,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 760;

              if (isMobile) {
                return Column(
                  children: [
                    photo,
                    const SizedBox(height: 16),
                    bio,
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.imageOnLeft
                    ? [
                        Expanded(flex: 2, child: photo),
                        const SizedBox(width: 24),
                        Expanded(flex: 10, child: bio),
                      ]
                    : [
                        Expanded(flex: 10, child: bio),
                        const SizedBox(width: 24),
                        Expanded(flex: 2, child: photo),
                      ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PhotoCard extends StatelessWidget {
  final TeamPerson person;

  const _PhotoCard({required this.person});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dpr = MediaQuery.of(context).devicePixelRatio;
        // Card 4/5 (Instagram). Usamos a largura como base.
        final cacheWidth =
            (constraints.maxWidth * dpr).round().clamp(420, 1400);

        return AspectRatio(
          aspectRatio: 4 / 5, // 👈 formato Instagram
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFFE4ECE9)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: person.photoAsset != null
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        Image(
                          image: ResizeImage(
                            AssetImage(person.photoAsset!),
                            width: cacheWidth,
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),

                        // Overlay suave
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.05),
                                Colors.black.withOpacity(0.45),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),

                        Positioned(
                          left: 14,
                          right: 14,
                          bottom: 14,
                          child: Text(
                            '${person.name} - ${person.roleShort}',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              height: 1.15,
                            ),
                          ),
                        ),
                      ],
                    )
                  : _Fallback(
                      initials: person.initials,
                      role: person.roleShort,
                    ),
            ),
          ),
        );
      },
    );
  }
}

class _Fallback extends StatelessWidget {
  final String initials;
  final String role;

  const _Fallback({
    required this.initials,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.secondary.withOpacity(0.55),
            AppColors.primary.withOpacity(0.25),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: const Color(0xFFE4ECE9)),
              ),
              child: Center(
                child: Text(
                  initials,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                role,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BioCard extends StatelessWidget {
  final TeamPerson person;

  const _BioCard({required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.secondary,
            AppColors.background,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(22),
        //border: Border.all(color: const Color(0xFFE4ECE9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: person.socialmediaLink != null
                  ? () {
                      final url = Uri.parse('https://${person.socialmediaLink!}');
                      launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  : null,
              child: Row(
                children: [
                                    FaIcon(
                    FontAwesomeIcons.instagram,
                    size: 24,
                    color: Colors.pink,
                  ),
                  SizedBox(width: 10),
                  Text(
                    person.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  

                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            person.roleFull,
            style: const TextStyle(
              color: AppColors.textMuted,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 14),
          ...person.bullets.map(
            (b) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('•  '),
                  Expanded(
                    child: Text(
                      b,
                      style: const TextStyle(height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
