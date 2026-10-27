import 'package:flutter/material.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';
import 'package:page_crealo/desing_system/tokens/app_text_styles.dart';

class AppSectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextAlign textAlign;
  final Color titleColor;
  final Color subtitleColor;

  const AppSectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.textAlign = TextAlign.center,
    this.titleColor = AppColors.backgroundDark,
    this.subtitleColor = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: switch (textAlign) {
        TextAlign.left => CrossAxisAlignment.start,
        TextAlign.right => CrossAxisAlignment.end,
        _ => CrossAxisAlignment.center,
      },
      children: [
        Text(
          title,
          textAlign: textAlign,
          style: AppTextStyles.h2.copyWith(color: titleColor),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subtitle!,
            textAlign: textAlign,
            style: AppTextStyles.body.copyWith(color: subtitleColor),
          ),
        ],
      ],
    );
  }
}
