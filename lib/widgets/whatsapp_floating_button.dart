
import 'package:flutter/material.dart';
import 'package:page_crealo/data/social_links.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappFloatingButton extends StatelessWidget {
  const WhatsappFloatingButton({super.key});

  Future<void> _openWhatsApp() async {
    final uri = Uri.parse(SocialLinks.whatsapp);

    await launchUrl(
      uri,
      webOnlyWindowName: '_blank',
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _openWhatsApp,
      backgroundColor: const Color(0xFF25D366),
      foregroundColor: Colors.white,
      elevation: 4,
      tooltip: 'Contáctanos por WhatsApp',
      child: Icon(SimpleIcons.whatsapp, size: 28),
    );
  }
}
