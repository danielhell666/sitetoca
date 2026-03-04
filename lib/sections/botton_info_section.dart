import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/platform_helper.dart';
import '../data/links.dart';
import '../theme/app_colors.dart';

class BottonInfoSection extends StatelessWidget {
  const BottonInfoSection({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void _onPhoneTap() {
    final url =
        PlatformHelper.isWebDesktop ? AppLinks.whatsappUrl() : AppLinks.telUrl();
    _open(url);
  }

  String _staticMapUrl() {
    const lat = -15.7942;
    const lon = -47.9292;

    return 'https://static-maps.yandex.ru/1.x/'
        '?lang=pt_BR&ll=$lon,$lat&z=15&size=450,240&l=map&pt=$lon,$lat,pm2gnm';
  }

  // helper used only by this class; copies text and shows feedback
  void _copy(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copiado para área de transferência')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE4ECE9)),
      ),
      child: LayoutBuilder(
        builder: (context, c) {
          final isMobile = c.maxWidth < 820;

          final info = _InfoBlock(
            onPhoneTap: _onPhoneTap,
            onWhatsappTap: () => _open(AppLinks.whatsappUrl()),
            onInstagramTap: () => _open(AppLinks.instagram),
            onAddressTap: () => _open(AppLinks.mapsUrl()),
          );

          final map = _MapPreview(
            imageUrl: _staticMapUrl(),
            onTap: () => _open(AppLinks.mapsUrl()),
          );

          if (isMobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Informações',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 12),
                info,
                const SizedBox(height: 14),
                map,
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informações',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 12),
                    info,
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(flex: 5, child: map),
            ],
          );
        },
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final VoidCallback onPhoneTap;
  final VoidCallback onWhatsappTap;
  final VoidCallback onInstagramTap;
  final VoidCallback onAddressTap;

  const _InfoBlock({
    required this.onPhoneTap,
    required this.onWhatsappTap,
    required this.onInstagramTap,
    required this.onAddressTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _InfoLine(
          icon: Icon(FontAwesomeIcons.phone, size: 16, color: AppColors.primary),
          label: 'Telefone',
          value: AppLinks.phoneLabel,
          onTap: onPhoneTap,
          onCopy: () {
            Clipboard.setData(ClipboardData(text: AppLinks.phoneLabel));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Copiado para área de transferência')),
            );
          },
        ),
        const SizedBox(height: 10),
        _InfoLine(
          icon: Icon(FontAwesomeIcons.whatsapp, size: 16, color: Colors.green),
          label: 'WhatsApp',
          value: AppLinks.whatsappLabel,
          onTap: onWhatsappTap,
          onCopy: () {
            Clipboard.setData(ClipboardData(text: AppLinks.whatsappLabel));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Copiado para área de transferência')),
            );
          },
        ),
        const SizedBox(height: 10),
        _InfoLine(
          icon: Icon(FontAwesomeIcons.instagram, size: 16, color: Colors.pink),
          label: 'Instagram',
          value: 'tocadotamandua.terapias',
          onTap: onInstagramTap,
          // Instagram QR string rarely copied, skip onCopy
        ),
        const SizedBox(height: 10),
        _InfoLine(
          icon: Icon(FontAwesomeIcons.locationDot, size: 16, color: AppColors.primary),
          label: 'Endereço',
          value: AppLinks.addressLabel,
          isMultiline: true,
          onCopy: () {
            Clipboard.setData(ClipboardData(text: AppLinks.addressLabel));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Copiado para área de transferência')),
            );
          },
          //onTap: onAddressTap,
        ),
      ],
    );
  }
}

class _InfoLine extends StatelessWidget {
  final Icon icon;
  final String label;
  final String value;
  final bool isMultiline;
  final VoidCallback? onTap;
  final VoidCallback? onCopy;

  const _InfoLine({
    required this.icon,
    required this.label,
    required this.value,
    this.isMultiline = false,
    this.onTap,
    this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.18),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4ECE9)),
      ),
      child: Row(
        crossAxisAlignment:
            isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE4ECE9)),
            ),
            child: Center(
              child: icon,
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 88,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style:
                  const TextStyle(color: AppColors.textMuted, height: 1.35),
            ),
          ),
          if (onCopy != null) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onCopy,
              child: const Icon(
                Icons.copy,
                size: 18,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ],
      ),
    );

    if (onTap == null && onCopy == null) return content;

    // wrap with semantics only when interactive
    Widget wrapped = content;
    if (onTap != null) {
      wrapped = Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: content,
        ),
      );
    }
    return wrapped;
  }
}

class _MapPreview extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const _MapPreview({required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE4ECE9)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppColors.secondary.withOpacity(0.18),
                    child: const Center(child: Text('Mapa indisponível')),
                  ),
                ),
              ),
              Positioned(
                left: 12,
                bottom: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.88),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFE4ECE9)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(FontAwesomeIcons.mapLocationDot,
                          size: 16, color: AppColors.primary),
                      SizedBox(width: 8),
                      Text('Abrir no mapa',
                          style: TextStyle(fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}