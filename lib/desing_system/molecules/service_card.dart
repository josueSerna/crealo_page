import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';

import '../atoms/app_button.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_text_styles.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    this.minHeight = const BreakifyValue(sm: 340.0, md: 330.0, lg: 280.0),
    this.icon,
    this.buttonLabel = 'Ver más',
    this.onPressed,
  });

  final String title;
  final String description;
  final BreakifyValue<double> minHeight;
  final IconData? icon;
  final String buttonLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final resolvedMinHeight = context.resolve(minHeight);

    return Container(
      constraints: BoxConstraints(minHeight: resolvedMinHeight),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.textSecondary.withValues(alpha: 0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 32, color: AppColors.primary),
            const SizedBox(height: 16),
          ],
          Text(title, style: AppTextStyles.h3.copyWith(color: AppColors.white)),
          const SizedBox(height: 12),
          Text(
            description,
            style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
          ),
          const Spacer(),
          SizedBox(height: 20),
          AppButton(label: buttonLabel, onPressed: onPressed ?? () {}),
        ],
      ),
    );
  }
}
