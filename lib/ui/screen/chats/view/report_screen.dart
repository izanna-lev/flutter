import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/constant/app_functions.dart';
import 'package:tralever_module/services/chats_repo/chatRepo.dart';
import 'package:tralever_module/ui/shared/appbar.dart';
import 'package:tralever_module/ui/shared/dilog_box.dart';
import 'package:tralever_module/ui/shared/material_button.dart';

import '../../../../custem_class/constant/app_settings.dart';
import '../../../../models/chats/chat_list_model.dart';

class ReportScreen extends StatefulWidget {
  static const String routeName = "/ReportScreen";

  ReportScreen({Key? key}) : super(key: key);
  String specialistRef = Get.arguments;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  TextEditingController reportController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Report Specialist"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                cursorColor: Colors.black,
                maxLines: 7,
                controller: reportController,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Write briefly about your reason for reporting…",
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
                onTap: () async {
                  if (reportController.text.isEmpty) {
                    flutterToast("Please Enter Some Words");
                  } else {
                    SuccessResponse? response = await ChatRepo.reportUser(
                        specialistRef: widget.specialistRef,
                        reason: reportController.text.trim());
                    if (response != null) {
                      showSuccessDialogBox();
                    }
                  }
                },
                text: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSuccessDialogBox() {
    return showCustomDialog(
      context: context,
      content:
          "We have recieved your request. We will shortly look back to your issue.",
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
