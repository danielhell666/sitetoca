import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../data/specialties_data.dart';
import '../theme/app_colors.dart';

class SpecialtiesSection extends StatelessWidget {
  const SpecialtiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = specialtiesItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Especialidades',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        const Text(
          'Atendimento especializado em desenvolvimento infantil e neurodesenvolvimento.',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textMuted,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 18),
        LayoutBuilder(
          builder: (context, c) {
            final w = c.maxWidth;

            return Wrap(
              spacing: 14,
              runSpacing: 14,
              children: List.generate(items.length, (i) {
                double cardWidth;

                if (w >= 1100) {
                  cardWidth = (w - (14 * 2)) / 3;
                } else if (w >= 740) {
                  cardWidth = (w - 14) / 2;
                } else {
                  cardWidth = w;
                }

                return SizedBox(
                  width: cardWidth,
                  child: _AnimatedSpecialtyCard(
                    item: items[i],
                    index: i,
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}

class _AnimatedSpecialtyCard extends StatefulWidget {
  final SpecialtyItem item;
  final int index;

  const _AnimatedSpecialtyCard({
    required this.item,
    required this.index,
  });

  @override
  State<_AnimatedSpecialtyCard> createState() => _AnimatedSpecialtyCardState();
}

class _AnimatedSpecialtyCardState extends State<_AnimatedSpecialtyCard> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    // Alterna entrada esquerda/direita
    final fromLeft = widget.index.isEven;

    return VisibilityDetector(
      key: ValueKey('spec-${widget.index}-${widget.item.title}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.18 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 420),
        opacity: _visible ? 1 : 0,
        curve: Curves.easeOut,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 420),
          curve: Curves.easeOut,
          offset: _visible
              ? Offset.zero
              : fromLeft
                  ? const Offset(-0.08, 0)
                  : const Offset(0.08, 0),
          child: _SpecialtyCard(item: widget.item),
        ),
      ),
    );
  }
}

class _SpecialtyCard extends StatelessWidget {
  final SpecialtyItem item;

  const _SpecialtyCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE4ECE9)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.25),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE4ECE9)),
            ),
            child: Center(
              child: FaIcon(
                item.icon,
                size: 18,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}