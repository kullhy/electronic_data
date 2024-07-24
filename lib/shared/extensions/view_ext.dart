import 'package:flutter/material.dart';

extension KeyExt on Key {}

extension ContextExt on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  dynamic get arguments => ModalRoute.of(this)?.settings.arguments;

  showSnackbar(Widget content, {Color? backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: content,
      backgroundColor: backgroundColor ?? Colors.green,
    ));
  }

  Future<dynamic> showAppDialog(Widget content,
      {bool barrierDismissible = true}) async {
    return mounted
        ? await showDialog(
            context: this,
            barrierDismissible: barrierDismissible,
            builder: (context) => content,
          )
        : null;
  }

  Future<dynamic> showAppModalBottomSheet(Widget content,
      {bool barrierDismissible = true}) async {
    return mounted
        ? await showModalBottomSheet(
            context: this,
            builder: (context) => content,
          )
        : null;
  }
}
