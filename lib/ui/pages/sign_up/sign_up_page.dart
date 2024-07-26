import 'package:electronic_data/shared/constant/load_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:electronic_data/common/app_images.dart';
import 'package:electronic_data/common/app_text_styles.dart';import 'package:electronic_data/ui/pages/sign_up/sign_up_cubit.dart';
import 'package:electronic_data/ui/pages/sign_up/sign_up_navigator.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SignUpCubit(navigator: SignUpNavigator(context: context));
      },
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late SignUpCubit _signUpCubit;

  @override
  void initState() {
    super.initState();
    _signUpCubit = context.read<SignUpCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return Container(
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
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),
                  Text(
                    'Đăng nhập',
                    style: AppTextStyle.blackS18Bold,
                  ),
                  Text(
                    "Tạo tài khoản mới để tiếp tục",
                    style: AppTextStyle.greyS14,
                    overflow: TextOverflow.clip,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  TextFormField(
                      key: _signUpCubit.userNameKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _signUpCubit.userNameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: 'Tên đăng nhập',
                          labelStyle: AppTextStyle.blackS20Bold,
                          suffixIcon: state.isUserName
                              ? const Icon(
                                  Icons.check_circle_sharp,
                                  color: Colors.black,
                                  size: 16,
                                )
                              : null),
                      validator: _signUpCubit.checkUser),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                      key: _signUpCubit.emailKey,
                      controller: _signUpCubit.emailController,
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
                      validator: _signUpCubit.checkEmail),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _signUpCubit.passwordController,
                    obscuringCharacter: "*",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Mật khẩu',
                      labelStyle: AppTextStyle.blackS20Bold,
                      suffixIcon: InkWell(
                        onTap: _signUpCubit.showPassWord,
                        child: Icon(
                          state.isShowPassWord
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ),
                    validator: _signUpCubit.checkPass,
                    obscureText: !state.isShowPassWord,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _signUpCubit.confirmPassController,
                    obscuringCharacter: "*",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Xác nhận lại mật khẩu',
                      labelStyle: AppTextStyle.blackS20Bold,
                      suffixIcon: InkWell(
                        onTap: _signUpCubit.showConfirmPassWord,
                        child: Icon(
                          state.isShowConfirmPassWord
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ),
                    obscureText: !state.isShowConfirmPassWord,
                    validator: _signUpCubit.checkTrueConfirmPass,
                  ),
                  const SizedBox(height: 20),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Checkbox(
                  //         value: state.isAccept,
                  //         onChanged: _signUpCubit.checkAccept,
                  //         fillColor: MaterialStateProperty.resolveWith(
                  //             AppColors.getColor)),
                  //     Flexible(
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(top: 10),
                  //         child: Text(
                  //           'Với vi'.tr,
                  //           style: AppTextStyle.tintS14,
                  //           overflow: TextOverflow.clip,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: (state.isAccept &&
                            state.isEmail &&
                            state.isUserName &&
                            state.isPass &&
                            state.isTrueConfirmPass)
                        ? _signUpCubit.signUp
                        : null,
                    child: Container(
                      width: double.infinity,
                      height: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: (state.isAccept &&
                                  state.isEmail &&
                                  state.isUserName &&
                                  state.isPass &&
                                  state.isTrueConfirmPass)
                              ? Colors.black
                              : Colors.grey),
                      child: Center(
                        child: state.loadStatus == LoadStatus.loading
                            ? const Center(child: CircularProgressIndicator())
                            : Text(
                                'Đăng ký',
                                style: AppTextStyle.whiteS16Bold,
                              ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      state.errorMessage,
                      style: AppTextStyle.errorText14Bold,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
