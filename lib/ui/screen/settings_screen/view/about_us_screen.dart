import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/ui/shared/appbar.dart';

import '../../../../services/api_routes.dart';
import '../controller/about_screen_controller.dart';

class AboutUsScreen extends StatefulWidget {
  static const String routeName = "/AboutUsScreen";

  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  initState() {
    ///   aboutScreenController.getStaticData();
    super.initState();
  }

  AboutScreenController aboutScreenController =
      Get.find<AboutScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: getScreenTitle()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder(
          builder: (AboutScreenController aboutScreenController) {
            return
                SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      getScreenContent(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String getScreenTitle() {
    if(SEETING_SCREEN_TYPE == SETTING_SCREEN.ABOUT) {
      return "About Us";
    }
    else if(SEETING_SCREEN_TYPE == SETTING_SCREEN.TERMS_CONDITION) {
      return "Terms & Conditions";
    }
    else if(SEETING_SCREEN_TYPE == SETTING_SCREEN.PRIVACY_POLICY) {
      return "Privacy Policy";
    }
    return "";
  }

  String getScreenContent() {
    print("aboutScreenController.screenType : ${SEETING_SCREEN_TYPE}");
    if(SEETING_SCREEN_TYPE == SETTING_SCREEN.ABOUT) {
      return aboutScreenController.appDetailDataModel?.aboutUs
          .toString() ?? "";
    }
    else if(SEETING_SCREEN_TYPE == SETTING_SCREEN.TERMS_CONDITION) {
      return aboutScreenController.appDetailDataModel?.termsAndConditions
          .toString() ?? "";
    }
    else if(SEETING_SCREEN_TYPE == SETTING_SCREEN.PRIVACY_POLICY) {
      return aboutScreenController.appDetailDataModel?.privacyPolicy
          .toString() ?? "";
    }
    return "";
  }
  
}
