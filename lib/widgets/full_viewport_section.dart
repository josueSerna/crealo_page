import 'package:flutter/material.dart';

class FullViewportSection extends StatelessWidget {
  const FullViewportSection({
    super.key,
    required this.child,
    this.backgroundColor,
    this.alignment = Alignment.center,
  });

  final Widget child;
  final Color? backgroundColor;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final viewportHeight = MediaQuery.sizeOf(context).height;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: viewportHeight),
      child: Container(
        width: double.infinity,
        color: backgroundColor,
        alignment: alignment,
        child: child,
      ),
    );
  }
}
