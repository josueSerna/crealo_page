import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';
import 'package:page_crealo/desing_system/tokens/app_text_styles.dart';
import 'package:page_crealo/widgets/full_viewport_section.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  static const _horizontalPadding = BreakifyFluidValue(sm: 20, md: 40, lg: 64);
  static const _verticalPadding = BreakifyFluidValue(sm: 56, md: 80, lg: 112);

  static const _brandFontSize = BreakifyFluidValue(sm: 84, md: 130, lg: 190);
  static const _scriptFontSize = BreakifyFluidValue(sm: 16, md: 20, lg: 24);
  static const _bodyFontSize = BreakifyFluidValue(sm: 14, md: 15, lg: 16);

  static const _buttonSpacing = BreakifyFluidValue(sm: 12, md: 16);
  static const _blockSpacing = BreakifyFluidValue(sm: 20, md: 28, lg: 36);

  @override
  Widget build(BuildContext context) {
    final hPad = context.resolve(_horizontalPadding);
    final vPad = context.resolve(_verticalPadding);
    final gap = context.resolve(_blockSpacing);

    return FullViewportSection(
      backgroundColor: AppColors.backgroundDark,
      child: Container(
        width: double.infinity,
        color: AppColors.backgroundDark,
        padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
        child: BreakifyContainer(
          maxWidth: const BreakifyValue(sm: 1100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _TagChip(label: 'CREATIVE STRATEGY & VISUAL DESIGN'),
              SizedBox(height: gap),
              _Headline(
                scriptSize: context.resolve(_scriptFontSize),
                brandSize: context.resolve(_brandFontSize),
              ),
              SizedBox(height: gap),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Text(
                  'Diseño audaz, producción UGC y estrategias de impacto '
                  'para marcas visionarias.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    fontSize: context.resolve(_bodyFontSize),
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              SizedBox(height: gap + 4),
              _Actions(spacing: context.resolve(_buttonSpacing)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline({required this.scriptSize, required this.brandSize});

  final double scriptSize;
  final double brandSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'No es tan difícil, solo',
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
            fontSize: scriptSize,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            color: AppColors.backgroundLight,
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'créalo',
            textAlign: TextAlign.center,
            style: AppTextStyles.h1.copyWith(
              fontSize: brandSize,
              fontWeight: FontWeight.w800,
              height: 1.0,
              letterSpacing: -brandSize * 0.04,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.small.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
                color: AppColors.backgroundLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({required this.spacing});

  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: spacing,
      runSpacing: spacing,
      children: [
        _PillButton(
          label: 'EXPLORAR PORTAFOLIO',
          icon: Icons.arrow_downward_rounded,
          filled: true,
          onPressed: () {},
        ),
        _PillButton(
          label: 'VER SERVICIOS',
          icon: Icons.north_east_rounded,
          filled: false,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _PillButton extends StatelessWidget {
  const _PillButton({
    required this.label,
    required this.icon,
    required this.filled,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final bool filled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Color fg = filled
        ? AppColors.backgroundDark
        : AppColors.backgroundLight;

    return Material(
      color: filled ? AppColors.backgroundLight : Colors.transparent,
      shape: StadiumBorder(
        side: filled
            ? BorderSide.none
            : BorderSide(color: AppColors.white.withValues(alpha: 0.2)),
      ),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppTextStyles.button.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: fg,
                ),
              ),
              const SizedBox(width: 10),
              Icon(icon, size: 16, color: fg),
            ],
          ),
        ),
      ),
    );
  }
}
