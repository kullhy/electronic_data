import 'package:electronic_data/shared/constant/load_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:electronic_data/common/app_images.dart';
import 'package:electronic_data/common/app_text_styles.dart';
import 'package:electronic_data/ui/pages/login/login_cubit.dart';
import 'package:electronic_data/ui/pages/login/login_navigator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginCubit(navigator: LoginNavigator(context: context));
      },
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginCubit _loginCubit;
  bool isEmail = false;

  @override
  void initState() {
    super.initState();
    _loginCubit = context.read<LoginCubit>();
    _loginCubit.saveOnboardingFlag();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(76, 60, 80, 25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppImages.logo,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  Text(
                    'Chào mừng!',
                    style: AppTextStyle.blackS18Bold,
                  ),
                  Text(
                    "Đăng nhập để tiếp tục",
                    style: AppTextStyle.greyS14,
                    overflow: TextOverflow.clip,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    // key: _loginCubit.emailKey,
                    controller: _loginCubit.emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        labelText: 'Email',
                        labelStyle: AppTextStyle.blackS20Bold,
                        suffixIcon: state.isEmail
                            ? const Icon(
                                Icons.check_circle_sharp,
                                color: Colors.black,
                                size: 16,
                              )
                            : null),
                    validator: _loginCubit.checkEmail,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _loginCubit.passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Mật khẩu',
                      labelStyle: AppTextStyle.blackS20Bold,
                      suffixIcon: InkWell(
                        onTap: _loginCubit.showPassWord,
                        child: Icon(
                          state.isShowPassWord
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ),
                    obscureText: !state.isShowPassWord,
                    validator: _loginCubit.checkPass,
                  ),
                  Center(
                    child: Text(
                      state.errorMessage,
                      style: AppTextStyle.errorText14Bold,
                    ),
                  ),
                  const SizedBox(height: 28),
                  InkWell(
                    onTap: (state.isEmail && state.isPass)
                        ? () {
                            _loginCubit.login(context);
                          }
                        : null,
                    child: Container(
                      width: double.infinity,
                      height: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: (state.isEmail && state.isPass)
                              ? Colors.black
                              : Colors.grey),
                      child: Center(
                        child: state.loadStatus == LoadStatus.loading
                            ? const Center(child: CircularProgressIndicator())
                            : Text(
                                "Đăng nhập",
                                style: AppTextStyle.whiteS16Bold,
                              ),
                      ),
                    ),
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 0.5,
                        width: size.width * 0.42,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      Text(
                        "Or",
                        style: AppTextStyle.blackS12Bold,
                      ),
                      Container(
                        height: 0.5,
                        width: size.width * 0.42,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: _loginCubit.openSignUp,
                    child: Center(
                      child: Text(
                        'Chưa có tài khoản? Tạo tài khoản mới',
                        style: AppTextStyle.blueS16Bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
