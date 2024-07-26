import 'dart:convert';

import 'package:electronic_data/domain/firestore/firestore_service.dart';
import 'package:electronic_data/shared/constant/load_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:electronic_data/database/share_preferences_helper.dart';
import 'package:electronic_data/ui/pages/login/login_navigator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginNavigator navigator;
  LoginCubit({required this.navigator}) : super(const LoginState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowPassWord = false;


  final emailKey = GlobalKey<FormState>();
    final _firestoreService = FirestoreService();

  String errorLoginMes = "";

  void saveOnboardingFlag() {
    SharedPreferencesHelper.setOnboard();
  }

  void showPassWord() {
    isShowPassWord = !isShowPassWord;
    emit(state.copyWith(isShowPassWord: isShowPassWord));
  }

  String? checkEmail(value) {
    if (value == null || value.isEmpty) {
      emit(state.copyWith(isEmail: false));

      return 'Vui lòng nhập địa chỉ email.';
    } else if (!isEmailValid(value)) {
      emit(state.copyWith(isEmail: false));

      return 'Đây không phải là định dạng email hợp lệ.';
    } else {
      emit(state.copyWith(isEmail: true));
    }
    return null; // Hợp lệ
  }

  String? checkPass(value) {
    if (value == null || value.isEmpty) {
      emit(state.copyWith(isPass: false));
      return 'Please enter password';
    } else {
      emit(state.copyWith(isPass: true));
    }
    return null; // Hợp lệ
  }

  Future<void> login(BuildContext context) async {
    final user = await _firestoreService.getUser(emailController.text);
      if (user != null && user.password == passwordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login successful')));
        // Navigate to the home screen or other relevant screen
        navigator.openMainPage();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid credentials')));
      }
    }
  

  void openSignUp() {
    navigator.openSignUp();
  }

  bool isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }

}