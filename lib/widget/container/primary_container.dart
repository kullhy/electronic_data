import 'package:flutter/material.dart';

import '../../../ui/resources/colors/colors.dart';

class PrimaryContainer extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const PrimaryContainer({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.grey1,
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
