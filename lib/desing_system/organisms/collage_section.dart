import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:page_crealo/data/collage_images.dart';
import 'package:page_crealo/desing_system/atoms/app_section_title.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';

class CollageSection extends StatelessWidget {
  const CollageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BreakifySection(
      backgroundColor: AppColors.primary,
      child: BreakifyContainer(
        maxWidth: const BreakifyValue(sm: 1200),
        padding: const BreakifyValue(
          sm: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          md: EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          lg: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        ),
        child: BreakifyBuilder(
          breakpoints: context.breakifyBreakpoints,
          builder: (context, breakpoint, constraints) {
            final verticalPadding =
                const BreakifyValue<double>(sm: 24, md: 32, lg: 40).resolve(
                  breakpoint,
                  constraints.maxWidth,
                  context.breakifyBreakpoints,
                );

            return Column(
              children: [
                const AppSectionTitle(
                  title: 'Contenido Fotográfico',
                  subtitle: 'La primera impresión tambien se crea.',
                  titleColor: AppColors.backgroundLight,
                  subtitleColor: AppColors.backgroundLight,
                ),
                SizedBox(height: verticalPadding),
                _BoundedCollage(verticalPadding: verticalPadding),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _BoundedCollage extends StatelessWidget {
  const _BoundedCollage({required this.verticalPadding});

  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const aspectRatio = 1.3;
        const spacing = 12.0;
        final availableHeight =
            MediaQuery.sizeOf(context).height - verticalPadding * 2;
        final widthFromHeight = availableHeight * aspectRatio;
        final collageWidth = widthFromHeight < constraints.maxWidth
            ? widthFromHeight
            : constraints.maxWidth;

        return Center(
          child: SizedBox(
            width: collageWidth > 0 ? collageWidth : 0,
            child: const AspectRatio(
              aspectRatio: aspectRatio,
              child: _DesktopCollage(spacing: spacing),
            ),
          ),
        );
      },
    );
  }
}

class _DesktopCollage extends StatelessWidget {
  const _DesktopCollage({required this.spacing});

  final double spacing;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
            [
              _Column(spacing: spacing, images: const [0, 1], largeFirst: true),
              SizedBox(width: spacing),
              _Column(
                spacing: spacing,
                images: const [2, 3],
                largeFirst: false,
              ),
              SizedBox(width: spacing),
              _Column(spacing: spacing, images: const [4, 5], largeFirst: true),
              SizedBox(width: spacing),
              _Column(
                spacing: spacing,
                images: const [6, 7],
                largeFirst: false,
              ),
            ].expand((child) {
              if (child is _Column) {
                return [Expanded(child: child)];
              }
              return [child];
            }).toList(),
      ),
    );
  }
}

class _Column extends StatelessWidget {
  const _Column({
    required this.spacing,
    required this.images,
    required this.largeFirst,
  });

  final double spacing;
  final List<int> images;
  final bool largeFirst;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: largeFirst ? 3 : 1,
          child: _CollageImage(index: images[0]),
        ),
        SizedBox(height: spacing),
        Expanded(
          flex: largeFirst ? 1 : 3,
          child: _CollageImage(index: images[1]),
        ),
      ],
    );
  }
}

class _CollageImage extends StatelessWidget {
  const _CollageImage({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.asset(
        collageImages[index],
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return ColoredBox(
            color: AppColors.backgroundDark.withValues(alpha: 0.16),
            child: const Center(
              child: Icon(
                Icons.image_outlined,
                color: AppColors.backgroundLight,
                size: 28,
              ),
            ),
          );
        },
      ),
    );
  }
}
