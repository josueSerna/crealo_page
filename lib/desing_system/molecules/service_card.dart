import 'package:flutter/material.dart';
import 'package:page_crealo/desing_system/atoms/app_button.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';

import '../tokens/app_text_styles.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String buttonLabel;
  final VoidCallback? onPressed;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.buttonLabel = 'Ver mas',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final descriptionText = Text(
      description,
      maxLines: 6,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.body,
    );

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary, width: 5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32, color: AppColors.primary),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTextStyles.h3.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 12),
            descriptionText,
            const SizedBox(height: 20),
            const Spacer(),
            AppButton(label: buttonLabel, onPressed: () {}),
            // ElevatedButton(
            //   onPressed: onPressed,
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.amber,
            //     foregroundColor: Colors.white,
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 24,
            //       vertical: 16,
            //     ),
            //     minimumSize: Size.zero,
            //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     elevation: 0,
            //   ),
            //   child: Text(buttonLabel, style: AppTextStyles.button),
            // ),
          ],
        ),
      ),
    );
  }
}
