import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/clinic_description_data.dart';

class ClinicDescriptionSection extends StatelessWidget {
  const ClinicDescriptionSection({super.key});

  // Ajuste para o caminho real da sua logo
  static const String logoAsset = 'images/icons/logod.png';

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
                  //_LogoMark(size: isMobile ? 46 : 56),
                  //const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          clinicTitle,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.2,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Text(
                        //   clinicSubtitle,
                        //   style: TextStyle(
                        //     height: 1.35,
                        //     color: AppColors.textMuted,
                        //     fontSize: isMobile ? 13 : 14,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // texto inicial geral
              const Text(
                clinicOverview,
                style: TextStyle(
                  height: 1.6,
                  fontSize: 14.5,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 18),

              // campos detalhados
              const _SectionBlock(
                heading: 'Missão',
                content: clinicMission,
              ),
              const SizedBox(height: 12),
              const _SectionBlock(
                heading: 'Modo de atuação',
                content: clinicApproach,
              ),
              const SizedBox(height: 12),
              const _SectionBlock(
                heading: 'Valores',
                content: clinicValues,
              ),
              const SizedBox(height: 12),
              const _SectionBlock(
                heading: 'Propósito',
                content: clinicPurpose,
              ),
            ],
          ),
        );
      },
    );
  }
}

// class _LogoMark extends StatelessWidget {
//   final double size;
//   const _LogoMark({required this.size});

//   // Ajuste para o caminho real da sua logo
//   static const String logoAsset = 'images/icons/logod.png';

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.92),
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(color: const Color(0xFFE4ECE9)),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 14,
//             offset: const Offset(0, 8),
//             color: Colors.black.withOpacity(0.05),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Image.asset(
//           logoAsset,
//           fit: BoxFit.cover,
//           errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported_rounded),
//         ),
//       ),
//     );
//   }
// }


// bloco simples com título + corpo usado na seção
class _SectionBlock extends StatelessWidget {
  final String heading;
  final String content;

  const _SectionBlock({required this.heading, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: const TextStyle(
            height: 1.6,
            fontSize: 14.5,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}