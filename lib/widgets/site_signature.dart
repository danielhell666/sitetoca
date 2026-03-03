import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors.dart';

class SiteSignature extends StatelessWidget {
  const SiteSignature({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: 12),
          Text(
            '© $year Toca do Tamanduá Terapias',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 6),
          InkWell(
            onTap: () =>
                _open('https://www.linkedin.com/in/danielfno'),
            child: const Text(
              'Desenvolvido por DFNSolutions',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textMuted,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}