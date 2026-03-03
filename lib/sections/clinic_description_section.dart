import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ClinicDescriptionSection extends StatelessWidget {
  const ClinicDescriptionSection({super.key});

  // Ajuste para o caminho real da sua logo
  static const String logoAsset = 'images/logo.jpg';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final isMobile = c.maxWidth < 760;

        return Container(
          padding: EdgeInsets.all(isMobile ? 18 : 26),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE4ECE9)),
            gradient: LinearGradient(
              colors: [
                AppColors.secondary.withOpacity(0.24),
                AppColors.primary.withOpacity(0.10),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // topo: selo + título
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _LogoMark(size: isMobile ? 46 : 56),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Clínica Toca do Tamanduá Terapias',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.2,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Atendimento especializado para bebês, crianças e adolescentes.',
                          style: TextStyle(
                            height: 1.35,
                            color: AppColors.textMuted,
                            fontSize: isMobile ? 13 : 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // pílulas
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _Pill(text: 'Bebês • Crianças • Adolescentes'),
                  _Pill(text: 'Equipe interdisciplinar'),
                  _Pill(text: 'Atendimento individualizado'),
                ],
              ),

              const SizedBox(height: 18),

              // texto
              const Text(
                'Clínica multiprofissional em Brasília/DF dedicada à avaliação e intervenção de bebês, crianças e adolescentes com dificuldades e/ou atrasos no neurodesenvolvimento.',
                style: TextStyle(
                  height: 1.6,
                  fontSize: 14.5,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Com a terapia centrada na família, cada criança é avaliada de forma individual, com planejamento terapêutico estruturado e acompanhamento contínuo. A família participa ativamente do processo, recebendo orientação clara, escuta qualificada e direcionamento seguro.',
                style: TextStyle(
                  height: 1.6,
                  fontSize: 14.5,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LogoMark extends StatelessWidget {
  final double size;
  const _LogoMark({required this.size});

  // Ajuste para o caminho real da sua logo
  static const String logoAsset = 'images/logo.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.92),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE4ECE9)),
        boxShadow: [
          BoxShadow(
            blurRadius: 14,
            offset: const Offset(0, 8),
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          logoAsset,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported_rounded),
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;
  const _Pill({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFE4ECE9)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12.5,
          fontWeight: FontWeight.w800,
          color: AppColors.textDark,
        ),
      ),
    );
  }
}