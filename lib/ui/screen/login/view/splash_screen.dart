import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/ui/screen/login/view/onboarding_screen.dart';

import '../../../../custem_class/constant/app_images.dart';
import '../../../../custem_class/utils/local_storage.dart';
import '../../base_screen/view/base_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () async {
      if (LocalStorage.getOnBoarding()) {
        if (LocalStorage.getUserDetail()) {
          Get.offAllNamed(BaseScreen.routeName);
        } else {
          Get.offAllNamed(LoginScreen.routeName);
        }
      } else {
        Get.offAllNamed(OnBoardingScreen.routeName);
      }
    });
    super.initState();
  }
  // void initState() {
  //   super.initState();
  //
  //   Timer(const Duration(seconds: 3),
  //       () => Get.toNamed(OnBoardingScreen.routeName));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppImages.splashScreenBackgroundImage),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Image.asset(
            AppImages.splashScreenLogo,
            height: 79,
            width: 252,
          ),
        ),
      ),
    );
  }
}
