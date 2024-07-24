import 'package:flutter/material.dart';

class AppNavigator {
  static void push(BuildContext context, Widget page) {
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    }
  }

  static void pushReplacement(BuildContext context, Widget page) {
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    }
  }

  static Future<void> pushNamed(BuildContext context, String route,
      {dynamic arguments}) async {
    if (context.mounted) {
      await Navigator.pushNamed(
        context,
        route,
        arguments: arguments,
      );
    }
  }

  static void pushReplacementNamed(BuildContext context, String route,
      {dynamic arguments}) {
    if (context.mounted) {
      Navigator.pushReplacementNamed(
        context,
        route,
        arguments: arguments,
      );
    }
  }

  static void ofContextPush(BuildContext context, Widget page) {
    if (context.mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );
    }
  }

  static void pop(BuildContext context, [dynamic data]) {
    if (context.mounted) Navigator.pop(context, data);
  }
}
