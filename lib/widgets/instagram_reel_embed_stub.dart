import 'package:flutter/material.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';

/// Fallback para plataformas distintas a web, donde no existe iframe.
class InstagramReelEmbed extends StatelessWidget {
  final String embedUrl;
  final String title;
  final bool interactive;

  const InstagramReelEmbed({
    super.key,
    required this.embedUrl,
    required this.title,
    this.interactive = true,
  });

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.backgroundDark,
      child: Center(
        child: Text(
          'El reproductor solo está disponible en web.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
