import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';

import '../../custem_class/constant/app_settings.dart';
import '../../custem_class/utils/size_config.dart';

Future<void> showCustomDialog({
  required BuildContext context,
  double? height,
  String? title,
  required String content,
  required double contentSize,
  required Function()? onTap,
  required Color color,
  required String okText,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)), //this right here
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: FittedBox(
            child: SizedBox(
              width: Get.width,
              child: Column(
                children: [
                  SizedBox(height: getHeight(20)),
                  title == null
                      ? const SizedBox()
                      : Text(
                          title,
                          style: const TextStyle(
                            fontFamily: kAppFont,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                  SizedBox(height: getHeight(16)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 1.4,
                        fontFamily: kAppFont,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(25)),
                  // const Divider(
                  //   thickness: 0.5,
                  //   color: Colors.black,
                  // ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: MaterialButton(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      onPressed: onTap,
                      color: color,
                      child: Text(
                        okText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: kAppFont,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Future<void> showCustomDialogLogOut({
  required BuildContext context,
  double? height,
  String? title,
  required String content,
  required double contentSize,
  required Function()? noonTap,
  required Function()? yesonTap,
  required Color color,
  required String okText,
  required String noText,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)), //this right here
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: FittedBox(
            child: SizedBox(
              width: Get.width,
              child: Column(
                children: [
                  SizedBox(height: getHeight(20)),
                  title == null
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: kAppFont,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                  SizedBox(height: getHeight(16)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        height: 1.5,
                        fontFamily: kAppFont,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(30)),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: yesonTap,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 100,
                            color: AppColors.appBlueColor,
                            child: Center(
                              child: Text(
                                okText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: kAppFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: noonTap,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.appBlueColor),
                            ),
                            child: Center(
                              child: Text(
                                noText,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: kAppFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Future<void> showCustomDialogItinerary({
  required BuildContext context,
  double? height,
  String? title,
  required String content,
  required String policyText,
  required double contentSize,
  required Function()? noonTap,
  required Function()? yesonTap,
  required void Function() policyTextOnTap,
  required Color color,
  required String okText,
  required String noText,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)), //this right here
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: FittedBox(
            child: SizedBox(
              width: Get.width,
              child: Column(
                children: [
                  SizedBox(height: getHeight(20)),
                  title == null
                      ? const SizedBox()
                      : Text(
                          title,
                          style: const TextStyle(
                            fontFamily: kAppFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                  SizedBox(height: getHeight(16)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Text(
                          content,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            height: 1.5,
                            fontFamily: kAppFont,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: policyTextOnTap,
                          child: Text(
                            policyText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: kAppFont,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getHeight(30)),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: yesonTap,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 100,
                            color: AppColors.appBlueColor,
                            child: Center(
                              child: Text(
                                okText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: kAppFont,
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: noonTap,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.appBlueColor),
                            ),
                            child: Center(
                              child: Text(
                                noText,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: kAppFont,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
