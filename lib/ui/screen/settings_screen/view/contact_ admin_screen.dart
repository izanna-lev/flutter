import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/ui/shared/appbar.dart';
import '../../../../custem_class/constant/app_colors.dart';
import '../../../../custem_class/constant/app_functions.dart';

import '../../../../custem_class/constant/app_settings.dart';
import '../../../shared/dilog_box.dart';
import '../../../shared/material_button.dart';
import '../controller/contactadmin_controller.dart';

class ContactAdminScreen extends StatefulWidget {
  static const String routeName = "/ContactAdminScreen";

  const ContactAdminScreen({Key? key}) : super(key: key);

  @override
  _ContactAdminScreenState createState() => _ContactAdminScreenState();
}

class _ContactAdminScreenState extends State<ContactAdminScreen> {
  ContactAdminController contactAdminController =
      Get.find<ContactAdminController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: commonAppbar(titleText: "Contact Admin"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  cursorColor: Colors.black,
                  maxLines: 7,
                  controller: contactAdminController.contactAdminTextController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Write briefly about your issue…".tr,
                    hintStyle: const TextStyle(
                      fontFamily: kAppFont,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: const Color(0xffEDEDED),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                materialButton(
                  onTap: () {
                    disposeKeyboard();
                    if (contactAdminController
                        .contactAdminTextController.text.isEmpty) {
                      flutterToast("Please Enter Some One Text");
                    } else {
                      contactAdminController.contactAdminText =
                          contactAdminController.contactAdminTextController.text
                              .trim();
                      contactAdminController.contactAdminTextController.clear();
                      contactAdminController
                          .contactAdmin()
                          .then((value) => dialogBox());
                    }
                  },
                  text: "Submit",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dialogBox() {
    return showCustomDialog(
      context: context,
      content:
          "Your request has been submitted successfully. We will shortly look back to your issue.",
      contentSize: 1,
      onTap: () {
        Get.back();
        Get.back();
      },
      color: AppColors.appBlueColor,
      okText: "Ok",
    );
  }
}
