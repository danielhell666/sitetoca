import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/links.dart';
import '../theme/app_colors.dart';

class WhatsAppFloatingButton extends StatelessWidget {
  const WhatsAppFloatingButton({super.key});

  Future<void> _open() async {
    final uri = Uri.parse(AppLinks.whatsappUrl());
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 16),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _open,
              borderRadius: BorderRadius.circular(18),
              child: Ink(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.22),
                      blurRadius: 18,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 18),   
                    SizedBox(width: 10),
                    Text(
                      'Marque uma avaliação',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}