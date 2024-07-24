import 'package:flutter/material.dart';
import '../../../ui/resources/colors/colors.dart';
import '../../../ui/resources/themes/app_text_theme.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Widget? leading;

  const PrimaryAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.textStyle,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: textStyle ?? AppTextTheme.whiteS16Bold,
      ),
      leading: leading,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: backgroundColor ?? AppColor.blue,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
