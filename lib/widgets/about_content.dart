import 'package:flutter/material.dart';
import 'package:page_crealo/data/social_links.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';
import 'package:page_crealo/desing_system/tokens/app_text_styles.dart';
import 'package:page_crealo/widgets/social_button.dart';
import 'package:simple_icons/simple_icons.dart';

class AboutTitle extends StatelessWidget {
  const AboutTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '¡Hola, somos Manu y Vale! Las mentes inquietas detrás de Créalo.',
      style: AppTextStyles.h2.copyWith(color: AppColors.primary),
    );
  }
}

class AboutContent extends StatelessWidget {
  final bool showTitle;

  const AboutContent({super.key, this.showTitle = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '¡Hola, somos Manu y Vale!',
          style: AppTextStyles.h2.copyWith(color: AppColors.primary),
        ),

        const SizedBox(height: 24),

        const Row(
          children: [
            SocialButton(
              icon: SimpleIcons.instagram,
              label: 'Instagram',
              url: SocialLinks.instagram,
            ),
            SizedBox(width: 12),
            SocialButton(
              icon: SimpleIcons.tiktok,
              label: 'TikTok',
              url: SocialLinks.tiktok,
            ),
            SizedBox(width: 12),
            SocialButton(
              icon: SimpleIcons.whatsapp,
              label: 'WhatsApp',
              url: SocialLinks.whatsapp,
            ),
          ],
        ),

        const SizedBox(height: 28),

        Text(
          'Somos las mentes inquietas detrás de Créalo.\n'
          'Una dice “se me ocurrió algo” y la otra ya está pensando cómo hacerlo realidad.\n'
          'Hemos creado contenido para marcas de diferentes industrias y eso nos enseñó algo: no existe una fórmula que funcione para todos.\n'
          'Por eso, entendemos lo que hace diferente a cada marca y lo transformamos en ideas, fotos, videos y estrategias con intención, personalidad y esencia propia.\n'
          'Porque puedes guardar mil referencias y seguir todas las tendencias, pero al final…\n'
          'No existe fórmula. Solo Créalo.',
          style: AppTextStyles.body.copyWith(
            color: AppColors.backgroundDark,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}
