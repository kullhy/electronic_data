import 'package:flutter/material.dart';

import '../colors/colors.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(extensions: [
    _lightAppColor,
  ]);

  static final _lightAppColor = AppColorExt(
    primaryColor: AppColor.primaryColor,
    primaryBackgroundColor: AppColor.primaryBackgroundColor,
  );
  static final dark = ThemeData.dark().copyWith(extensions: [
    _darkAppColor,
  ]);

  static final _darkAppColor = AppColorExt(
    primaryColor: AppColor.primaryColorDark,
    primaryBackgroundColor: AppColor.primaryBackgroundColorDark,
  );
}
