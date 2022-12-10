import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 1), () async {
    //   if (LocalStorage.getOnBoarding()) {
    //     if (LocalStorage.getUserDetail()) {
    //       Get.offAllNamed(BaseScreen.routeName);
    //     } else {
    //       Get.offAllNamed(LoginScreen.routeName);
    //     }
    //   } else {
    //     Get.offAllNamed(OnBoardingScreen.routeName);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage("assets/images/splash_screen_logo/splash_&_logo.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
