import 'package:flutter/material.dart';

abstract class AppColor {
  static const Color primaryBackgroundColor = Color(0xFFF2F2F2);
  static const Color primaryBackgroundColorDark =
      Color.fromARGB(255, 22, 22, 22);

  static Color primaryColor = const Color(0xFFE30D0D);
  static Color secondaryColor = const Color.fromARGB(255, 245, 114, 26);
  static Color primaryColorDark = const Color.fromARGB(255, 255, 196, 0);

  static Color transparent = Colors.transparent;
  static Color black = const Color(0xFF000000);
  static Color black2 = const Color(0xFF212121);
  static Color white = const Color(0xFFFFFFFF);
  static Color red = const Color(0xFFE30D0D);
  static Color grey = const Color(0xFF8C8C8C);
  static Color grey1 = const Color(0xFF909090);
  static Color grey2 = const Color(0xFF939393);
  static Color grey3 = const Color(0xFFE6E6E6);
  static Color blue = const Color(0xFF4285F4);
  static Color blue2 = const Color(0xFFE2EDFF);
  static Color newPrimaryColor = const Color(0xffF0F6FF);

   static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

// for dark/light mode
class AppColorExt extends ThemeExtension<AppColorExt> {
  final Color primaryColor;
  final Color primaryBackgroundColor;

  AppColorExt(
      {required this.primaryColor, required this.primaryBackgroundColor});

  @override
  ThemeExtension<AppColorExt> copyWith({
    Color? primaryColor,
    Color? primaryBackgroundColor,
  }) {
    return AppColorExt(
        primaryColor: primaryColor ?? this.primaryColor,
        primaryBackgroundColor:
            primaryBackgroundColor ?? this.primaryBackgroundColor);
  }

  @override
  ThemeExtension<AppColorExt> lerp(
      covariant ThemeExtension<AppColorExt>? other, double t) {
    if (other is! AppColorExt) return this;

    return AppColorExt(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      primaryBackgroundColor:
          Color.lerp(primaryBackgroundColor, other.primaryBackgroundColor, t)!,
    );
  }
}
