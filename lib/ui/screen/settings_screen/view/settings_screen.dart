import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rownd_flutter_plugin/rownd.dart';
import 'package:rownd_flutter_plugin/state/global_state.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/profile_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../custem_class/constant/app_icons.dart';
import '../../../../custem_class/utils/local_storage.dart';
import '../../../../custem_class/utils/size_config.dart';
import '../../../shared/dilog_box.dart';
import '../../login/view/login_screen.dart';
import '../controller/about_screen_controller.dart';
import 'about_us_screen.dart';
import 'contact_ admin_screen.dart';
import 'faq_screen.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "/SettingScreen";

  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  AboutScreenController aboutScreenController =
      Get.find<AboutScreenController>();

  ProfileController profileController = Get.find<ProfileController>();

  // @override
  // void initState() {
  //   aboutScreenController.getStaticData();
  //   super.initState();
  // }
  @override
  void dispose() {
    GlobalStateNotifier().dispose();
    super.dispose();
  }

  final _rownd = RowndPlugin();
  @override
  void initState() {
    _rownd.configure(rowndAppKey);
    // aboutScreenController.getStaticData();
    super.initState();
    // Provider.of<GlobalStateNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          settingSell(
            img: AppIcons.aboutIcon,
            text: "About Us",
            icon: Icons.navigate_next_sharp,
            onTap: () {
              if(aboutScreenController.appDetailDataModel != null && aboutScreenController.appDetailDataModel!.aboutUs.isNotEmpty) {
                SEETING_SCREEN_TYPE = SETTING_SCREEN.ABOUT;
                Get.toNamed(AboutUsScreen.routeName);
              }else{
                aboutScreenController.getStaticData();
              }
            },
          ),
          settingSell(
            img: AppIcons.teramsIcon,
            text: "Terms & Conditions",
            icon: Icons.navigate_next_sharp,
            onTap: () async {
              if(aboutScreenController.appDetailDataModel != null && aboutScreenController.appDetailDataModel!.termsAndConditions.isNotEmpty) {
                SEETING_SCREEN_TYPE = SETTING_SCREEN.TERMS_CONDITION;
                Get.toNamed(AboutUsScreen.routeName);
              }else{
                aboutScreenController.getStaticData();
              }
            },
          ),
          settingSell(
            img: AppIcons.privacyPolicyIcon,
            text: "Privacy Policy",
            icon: Icons.navigate_next_sharp,
            onTap: () {
              if(aboutScreenController.appDetailDataModel != null && aboutScreenController.appDetailDataModel!.privacyPolicy.isNotEmpty) {
                SEETING_SCREEN_TYPE = SETTING_SCREEN.PRIVACY_POLICY;
                Get.toNamed(AboutUsScreen.routeName);
              }else{
                aboutScreenController.getStaticData();
              }
              // launch(
              //   aboutScreenController.appDetailDataModel?.privacyPolicy ?? "",
              // );
            },
          ),
          settingSell(
              img: AppIcons.contactAdminIcon,
              text: "Contact Admin",
              icon: Icons.navigate_next_sharp,
              onTap: () {
                Get.toNamed(ContactAdminScreen.routeName);
              }),
          settingSell(
            img: AppIcons.faqIcon,
            text: "FAQs",
            icon: Icons.navigate_next_sharp,
            onTap: () {
              Get.toNamed(FAQScreen.routeName);
            },
          ),
          settingSell(
            img: AppIcons.removeUserIcon,
            text: "Delete Account",
            icon: Icons.navigate_next_sharp,
            onTap: () {
              deleteAccount();
            },
          ),
          settingSell(
            img: AppIcons.logoutIcon,
            text: "Logout",
            onTap: () {
              logoutBox();
            },
          ),
        ],
      )),
    );
  }

  Future<void> logoutBox() {
    return showCustomDialogLogOut(
      context: context,
      title: "Logout".tr,
      content: "Are you sure your want to logout?".tr,
      contentSize: 50,
      noonTap: () {
        Get.back();
      },
      yesonTap: () {
        Get.back();
        if (_rownd.state().state.auth?.isAuthenticated ?? false) {
          _rownd.signOut();
          print("Sign Out====>${_rownd.signOut}");
          LocalStorage.clearData();
          print('CLEAER_DATA${LocalStorage.clearData}');

          profileController.userProfileDetailsModel!.image = "";
        }
        Get.offAllNamed(LoginScreen.routeName);
      },
      color: AppColors.appBlueColor,
      okText: "YES",
      noText: "NO",
    );
  }

  Future? signout() {
    _rownd.signOut();
  }

  deleteAccount() {
    return showCustomDialogLogOut(
      context: context,
      title: "Delete Account".tr,
      content:
          "Are you sure you want to delete this account. This can't be undone."
              .tr,
      contentSize: 50,
      noonTap: () {
        Get.back();
      },
      yesonTap: () {
        Get.back();
        LocalStorage.clearData();
        aboutScreenController.deleteUser();
        Get.offAllNamed(LoginScreen.routeName);
      },
      color: AppColors.appBlueColor,
      okText: "YES".tr,
      noText: "NO".tr,
    );
  }

  settingSell({
    required String img,
    required String text,
    required void Function() onTap,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(
                      img,
                      height: 25,
                      width: 25,
                      color: AppColors.appBlueColor,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      text.tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      icon,
                      size: 35,
                      color: Colors.black45,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
