import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:page_crealo/data/testimonials.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';
import 'package:page_crealo/desing_system/tokens/app_text_styles.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BreakifySection(
      backgroundColor: AppColors.backgroundLight,
      fullViewport: true,
      child: BreakifyContainer(
        maxWidth: const BreakifyValue(sm: 1200),
        padding: const BreakifyValue(
          sm: EdgeInsets.symmetric(horizontal: 20, vertical: 64),
          md: EdgeInsets.symmetric(horizontal: 28, vertical: 72),
          lg: EdgeInsets.symmetric(horizontal: 32, vertical: 84),
        ),
        child: BreakifyBuilder(
          breakpoints: context.breakifyBreakpoints,
          builder: (context, breakpoint, constraints) {
            final isMobile = breakpoint == BreakifyBreakpoint.sm;
            final titleSize = isMobile ? 34.0 : 44.0;
            final bubbleWidth = switch (breakpoint) {
              BreakifyBreakpoint.sm => 1.0,
              BreakifyBreakpoint.md => 0.82,
              _ => 0.72,
            };

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Lo que cuentan quienes ya lo vivieron',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.small.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Experiencias que hablan por sí solas',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.primary,
                    fontSize: titleSize,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Cada proyecto empieza con una conversación y termina dejando algo que vale la pena compartir.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: isMobile ? 44 : 56),
                for (var index = 0; index < testimonials.length; index++) ...[
                  _TestimonialBubble(
                    testimonial: testimonials[index],
                    alignment: index.isEven
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    widthFactor: bubbleWidth,
                  ),
                  if (index < testimonials.length - 1)
                    SizedBox(height: isMobile ? 28 : 36),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _TestimonialBubble extends StatelessWidget {
  final Testimonial testimonial;
  final Alignment alignment;
  final double widthFactor;

  const _TestimonialBubble({
    required this.testimonial,
    required this.alignment,
    required this.widthFactor,
  });

  @override
  Widget build(BuildContext context) {
    final isReceived = testimonial.received;
    const bubbleColor = AppColors.primary;

    return Align(
      alignment: alignment,
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: CustomPaint(
          painter: _ChatBubblePainter(
            color: bubbleColor,
            tailOnLeft: isReceived,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        testimonial.clientName,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.backgroundLight,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Icon(
                      isReceived ? Icons.done_all : Icons.done,
                      color: AppColors.backgroundLight,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '“${testimonial.message}”',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.backgroundLight,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    testimonial.date,
                    style: AppTextStyles.small.copyWith(
                      color: AppColors.backgroundLight.withValues(alpha: 0.65),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatBubblePainter extends CustomPainter {
  final Color color;
  final bool tailOnLeft;

  const _ChatBubblePainter({required this.color, required this.tailOnLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final tailSize = 12.0;
    final bubbleRect = Rect.fromLTWH(
      tailOnLeft ? tailSize : 0,
      0,
      size.width - tailSize,
      size.height,
    );
    final bubble = Path()
      ..addRRect(
        RRect.fromRectAndRadius(bubbleRect, const Radius.circular(22)),
      );
    final tail = Path()
      ..moveTo(tailOnLeft ? tailSize : size.width - tailSize, size.height - 28)
      ..lineTo(tailOnLeft ? 0 : size.width, size.height)
      ..lineTo(
        tailOnLeft ? tailSize + 4 : size.width - tailSize - 4,
        size.height - 8,
      )
      ..close();

    canvas.drawPath(bubble..addPath(tail, Offset.zero), paint);
  }

  @override
  bool shouldRepaint(_ChatBubblePainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.tailOnLeft != tailOnLeft;
  }
}
