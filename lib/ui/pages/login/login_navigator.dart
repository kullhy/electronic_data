import 'package:electronic_data/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:electronic_data/ui/pages/sign_up/sign_up_page.dart';

class LoginNavigator {
  LoginNavigator({required this.context});
  final BuildContext context;

  void openSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  void openMainPage() {
     Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
