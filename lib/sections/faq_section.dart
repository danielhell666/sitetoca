import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../data/faq_data.dart';
import '../theme/app_colors.dart';

class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  bool _sectionVisible = false;

  void _startOnce() {
    if (_sectionVisible) return;
    setState(() => _sectionVisible = true);
  }





  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dúvidas frequentes',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 6),
        const Text(
          'Respostas rápidas sobre atendimentos, planos e funcionamento.',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textMuted,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 14),

        // Detecta a seção inteira entrando no viewport
        VisibilityDetector(
          key: const ValueKey('faq-section'),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.18) {
              _startOnce();
            }
          },
          child: Column(
            children: List.generate(faqData.length, (i) {
              return _AnimatedFaqTile(
                item: faqData[i],
                visible: _sectionVisible,
                delayMs: i * 110, // cascata de cima pra baixo
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _AnimatedFaqTile extends StatefulWidget {
  final FaqItem item;
  final bool visible;
  final int delayMs;

  const _AnimatedFaqTile({
    required this.item,
    required this.visible,
    required this.delayMs,
  });

  @override
  State<_AnimatedFaqTile> createState() => _AnimatedFaqTileState();
}

class _AnimatedFaqTileState extends State<_AnimatedFaqTile> {
  bool _show = false;
  bool _scheduled = false;

  @override
  void didUpdateWidget(covariant _AnimatedFaqTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Quando a seção fica visível, agenda o "aparecer" desse item com delay.
    if (widget.visible && !_scheduled) {
      _scheduled = true;

      Future.delayed(Duration(milliseconds: widget.delayMs), () {
        if (!mounted) return;
        setState(() => _show = true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
      opacity: _show ? 1 : 0,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 420),
        curve: Curves.easeOutCubic,
        // Vem de baixo e “sobe” até o lugar (efeito de cima pra baixo na sequência)
        offset: _show ? Offset.zero : const Offset(0, 0.06),
        child: _FaqTile(item: widget.item),
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  final FaqItem item;
  const _FaqTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE4ECE9)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 16),
          title: Text(
            item.question,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
          children: [
            Text(
              item.answer,
              style: const TextStyle(
                color: AppColors.textDark,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}