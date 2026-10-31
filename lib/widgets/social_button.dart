import 'package:flutter/material.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const SocialButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, color: AppColors.primary, size: 22),
      ),
    );
  }
}
