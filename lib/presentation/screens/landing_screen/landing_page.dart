import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/strings.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_styles.dart';
import '../../../data/shared/shared_service.dart';
import '../../router/app_router.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Duration duration = const Duration(seconds: 2);
  goToAuth() => Future.delayed(duration).then(
        (value) => Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouter.loginPage,
          (route) => false,
        ),
      );
  goToHome() => Future.delayed(duration).then(
        (value) => Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouter.homeScreen,
          (route) => false,
        ),
      );

  Future navigate() async {
    bool isUserIn = await SharedServices.isUserIn();
    if (isUserIn) {
      goToHome();
    } else {
      goToAuth();
    }
  }

  @override
  Widget build(BuildContext context) {
    navigate();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightElv0,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightElv0,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Strings.landingImage,
                  width: 50.w,
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  Strings.appTitle,
                  style: AppTextStyles.p1Primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
