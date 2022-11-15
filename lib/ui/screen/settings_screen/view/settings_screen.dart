import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rownd_flutter_plugin/rownd.dart';
import 'package:rownd_flutter_plugin/state/global_state.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
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
              Get.toNamed(AboutUsScreen.routeName);
            },
          ),
          settingSell(
            img: AppIcons.teramsIcon,
            text: "Terms & Conditions",
            icon: Icons.navigate_next_sharp,
            onTap: () async {
              var url = aboutScreenController
                      .appDetailDataModel?.termsAndConditions ??
                  "";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw "Failed to open LinkedIn";
              }
            },
          ),
          settingSell(
            img: AppIcons.privacyPolicyIcon,
            text: "Privacy Policy",
            icon: Icons.navigate_next_sharp,
            onTap: () {
              launch(
                aboutScreenController.appDetailDataModel?.privacyPolicy ?? "",
              );
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

  logoutBox() {
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
        LocalStorage.clearData();
        signout();
        Get.offAllNamed(LoginScreen.routeName);
        // Get.offAllNamed(LoginScreen.routeName)?.then((value) => signout());
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
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
