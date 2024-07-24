import 'package:flutter/material.dart';

import '../../../ui/resources/colors/colors.dart';
import '../../../ui/resources/themes/app_text_theme.dart';
import '../image/primary_svg_picture.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.label = '',
    this.textStyle,
    this.backgroundColor,
    this.borderColor,
    this.prefixIcon,
    this.paddingHorizontal,
    this.paddingVertical,
    this.borderRadius,
  });

  final VoidCallback onPressed;
  final String label;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? prefixIcon;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              backgroundColor ?? AppColor.secondaryColor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              side: BorderSide(
                  color: borderColor ?? Colors.transparent, width: 1),
            ),
          ),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
                vertical: paddingVertical ?? 16,
                horizontal: paddingHorizontal ?? 10),
          ),
          elevation: const MaterialStatePropertyAll(0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[
            PrimarySvgPicture(
              prefixIcon ?? '',
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 8,
            ),
          ],
          Text(
            label,
            textAlign: TextAlign.center,
            style: textStyle ?? AppTextTheme.whiteS14Bold,
          ),
        ],
      ),
    );
  }
}
