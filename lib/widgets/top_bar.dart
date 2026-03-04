import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/section_anchors.dart';
import '../theme/app_colors.dart';

class TopBar extends StatelessWidget {
  final Future<void> Function(HomeSection section) onNavigate;
  const TopBar({super.key, required this.onNavigate});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;

        final isMobile = w < 520;
        final isNarrowWeb = w >= 520 && w < 1100;

        return Container(
          decoration: const BoxDecoration(
            color: AppColors.secondary,
            border: Border(bottom: BorderSide(color: Color(0xFFE4ECE9))),
          ),
          child: SafeArea(
            bottom: false,
            child: Center(
              child: SizedBox(
                width: isMobile ? w : w * 0.85,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 12 : 8,
                    vertical: isMobile ? 8 : 18,
                  ),
                  child: isMobile
                      ? _MobileBar(open: _open, onNavigate: onNavigate)
                      : (isNarrowWeb
                          ? _NarrowWebBar(open: _open, onNavigate: onNavigate)
                          : _DesktopBar(open: _open, onNavigate: onNavigate)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DesktopBar extends StatelessWidget {
  final Future<void> Function(String) open;
  final Future<void> Function(HomeSection) onNavigate;
  const _DesktopBar({required this.open, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: _Brand(large: true)),
        const SizedBox(width: 18),

        // MENU (desktop)
        _NavLink('INÍCIO', () => onNavigate(HomeSection.inicio)),
        _NavLink('QUEM SOMOS', () => onNavigate(HomeSection.quemsomos)),
        _NavLink('ESPECIALIDADES', () => onNavigate(HomeSection.especialidades)),
        _NavLink('EQUIPE', () => onNavigate(HomeSection.equipe)),
        _NavLink('DEPOIMENTOS', () => onNavigate(HomeSection.depoimentos)),
        _NavLink('DÚVIDAS', () => onNavigate(HomeSection.duvidas)),
        _NavLink('CONTATO', () => onNavigate(HomeSection.contato)),
      ],
    );
  }
}

class _NarrowWebBar extends StatelessWidget {
  final Future<void> Function(String) open;
  final Future<void> Function(HomeSection) onNavigate;
  const _NarrowWebBar({required this.open, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: _Brand(large: false)),
        const SizedBox(width: 8),

        _NavMenu(onNavigate: onNavigate),

      ],
    );
  }
}

class _MobileBar extends StatelessWidget {
  final Future<void> Function(String) open;
  final Future<void> Function(HomeSection) onNavigate;
  const _MobileBar({required this.open, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          const Expanded(child: _Brand(large: false)),
          const SizedBox(width: 6),

          _NavMenu(onNavigate: onNavigate),

        ],
      ),
    );
  }
}

class _NavMenu extends StatelessWidget {
  final Future<void> Function(HomeSection) onNavigate;
  const _NavMenu({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<HomeSection>(
      tooltip: 'Menu',
      offset: const Offset(0, 46),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      itemBuilder: (context) => [
        for (final s in HomeSection.values)
          PopupMenuItem<HomeSection>(
            value: s,
            child: Text(sectionLabel(s)),
          ),
      ],
      onSelected: (s) => onNavigate(s),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.secondary.withOpacity(0.18),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE4ECE9)),
        ),
        child: const Icon(Icons.menu_rounded, color: AppColors.primary),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 13,
              color: AppColors.textDark,
            ),
          ),
        ),
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  final bool large;
  const _Brand({required this.large});

  @override
  Widget build(BuildContext context) {
    final logo = large ? 60.0 : 40.0;
    final title = large ? 20.0 : 15.5;
    final sub = large ? 14.0 : 12.0;

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            'assets/images/icons/logo.jpg',
            width: logo,
            height: logo,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Toca do Tamanduá',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: title,
                  fontWeight: FontWeight.w900,
                  height: 1.05,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Terapias Integradas',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: sub,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

