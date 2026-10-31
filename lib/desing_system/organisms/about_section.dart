import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';
import 'package:page_crealo/widgets/about_content.dart';
import 'package:page_crealo/widgets/about_image.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BreakifySection(
      fullViewport: true,
      child: Container(
        width: double.infinity,
        color: AppColors.backgroundLight,
        child: BreakifyContainer(
          maxWidth: const BreakifyValue(sm: 1200.0),
          padding: const BreakifyValue(
            sm: EdgeInsets.symmetric(horizontal: 20, vertical: 64),
            lg: EdgeInsets.symmetric(horizontal: 32, vertical: 60),
          ),
          child: BreakifyAdaptativeLayout(
            breakpoint: BreakifyBreakpoint.md,
            spacing: const BreakifyValue(sm: 40.0, lg: 64.0),
            distributeEvenly: true,
            crossAxisAlignment: CrossAxisAlignment.center,
            order: const BreakifyLayoutOrder(
              layoutBelow: BreakifyLayoutTemplate.inColumn,
              layoutAbove: BreakifyLayoutTemplate.twoColumns,
            ),
            children: const [AboutContent(), AboutImage()],
          ),
        ),
      ),
    );
  }
}
