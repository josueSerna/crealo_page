import 'package:flutter/material.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';

class AboutImage extends StatelessWidget {
  const AboutImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/crealo_profile.jpeg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppColors.primary.withValues(alpha: 0.08),
              alignment: Alignment.center,
              child: Icon(
                Icons.image_outlined,
                size: 64,
                color: AppColors.primary,
              ),
            );
          },
        ),
      ),
    );
  }
}
