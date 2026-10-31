import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';
import 'package:page_crealo/desing_system/tokens/app_text_styles.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterLink {
  final String label;
  final VoidCallback onTap;

  const FooterLink({required this.label, required this.onTap});
}

class FooterSection extends StatelessWidget {
  final List<FooterLink> links;

  // TODO: reemplazar por los enlaces reales de Créalo.
  static const _whatsappUrl = 'https://wa.me/';
  static const _instagramUrl = 'https://www.instagram.com/';
  static const _tiktokUrl = 'https://www.tiktok.com/';

  const FooterSection({super.key, required this.links});

  @override
  Widget build(BuildContext context) {
    return BreakifySection(
      backgroundColor: AppColors.backgroundDark,
      child: BreakifyContainer(
        maxWidth: const BreakifyValue(sm: 1200.0),
        padding: const BreakifyValue(
          sm: EdgeInsets.symmetric(horizontal: 20, vertical: 48),
          lg: EdgeInsets.symmetric(horizontal: 32, vertical: 56),
        ),
        child: Column(
          children: [
            BreakifyBuilder(
              breakpoints: context.breakifyBreakpoints,
              builder: (context, breakpoint, constraints) {
                final logo = Image.asset(
                  'assets/images/logos/logo_max.png',
                  height: 260,
                );
                final navigation = _FooterColumn(
                  title: 'Navegar',
                  children: [
                    for (final link in links)
                      _FooterTextButton(label: link.label, onTap: link.onTap),
                  ],
                );
                const contact = _FooterColumn(
                  title: 'Contáctanos',
                  children: [
                    _FooterContact(
                      icon: SimpleIcons.whatsapp,
                      label: 'WhatsApp',
                      url: _whatsappUrl,
                    ),
                    _FooterContact(
                      icon: SimpleIcons.instagram,
                      label: 'Instagram',
                      url: _instagramUrl,
                    ),
                    _FooterContact(
                      icon: SimpleIcons.tiktok,
                      label: 'TikTok',
                      url: _tiktokUrl,
                    ),
                  ],
                );

                if (breakpoint == BreakifyBreakpoint.sm) {
                  return Column(
                    children: [
                      logo,
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          navigation,
                          const SizedBox(width: 40),
                          contact,
                        ],
                      ),
                    ],
                  );
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: logo,
                      ),
                    ),
                    Expanded(child: navigation),
                    const Expanded(child: contact),
                  ],
                );
              },
            ),
            const SizedBox(height: 40),
            const Divider(color: AppColors.surfaceDark, height: 1),
            const SizedBox(height: 20),
            Text(
              '© ${DateTime.now().year} Créalo. Todos los derechos reservados.',
              textAlign: TextAlign.center,
              style: AppTextStyles.small.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FooterColumn({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h3.copyWith(
            color: AppColors.primary,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}

class _FooterTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterTextButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          label,
          style: AppTextStyles.body.copyWith(color: AppColors.backgroundLight),
        ),
      ),
    );
  }
}

class _FooterContact extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const _FooterContact({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url), webOnlyWindowName: '_blank'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primary, size: 20),
            const SizedBox(width: 12),
            Text(
              label,
              style: AppTextStyles.body.copyWith(
                color: AppColors.backgroundLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
