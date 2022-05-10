import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/strings.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../logic/cubit/login_cubit/login_cubit.dart';
import '../../router/app_router.dart';
import 'widgets/auth_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nicController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  login() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<LoginCubit>(context)
          .login(nic: nicController.text, password: passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightElv0,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightElv0,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    Strings.landingImage,
                    width: 50.w,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "Log In",
                    style: AppTextStyles.h1Primary,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: nicController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.card_membership_rounded,
                            ),
                            labelText: 'NIC',
                          ),
                          validator: (value) {
                            if (!RegExp(
                                    r'^(?:19|20)?\d{2}[0-9]{10}|[0-9]{9}[x|X|v|V]$')
                                .hasMatch(value!)) {
                              return 'Invalid NIC Number!';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextFormField(
                          controller: passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.password_rounded,
                            ),
                            hintText: '* * * * * *',
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is empty!';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters!';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSucceed) {
                              Navigator.pushNamed(
                                context,
                                AppRouter.landingPage,
                              );
                            }
                            if (state is LoginFailed) {
                              SnackBar snackBar =
                                  SnackBar(content: Text(state.errorMsg));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          builder: (context, state) {
                            if (state is LoginLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.primaryColor),
                              );
                            }
                            return AuthButton(
                              text: "Log In",
                              onTap: () => login(),
                            );
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Don't have an account?",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: " Register",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context)
                                    .pushNamedAndRemoveUntil(
                                        AppRouter.registerPage,
                                        (route) => false),
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
