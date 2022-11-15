import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/add_card_controller.dart';
import 'package:tralever_module/ui/screen/profile_screen/view/add_card_screen.dart';
import 'package:tralever_module/ui/shared/appbar.dart';

class ManagePaymentScreen extends StatefulWidget {
  static const String routeName = "/ManagePaymentScreen";

  const ManagePaymentScreen({Key? key}) : super(key: key);

  @override
  State<ManagePaymentScreen> createState() => _ManagePaymentScreenState();
}

class _ManagePaymentScreenState extends State<ManagePaymentScreen> {
  AddCardController addCardController = Get.find<AddCardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Manage Payment Methods"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Row(
                          children: [
                            Image.asset(
                              AppIcons.cardIcon,
                              height: 23,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "XXX-XXX-XXX-2521",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Remove Card",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }),
            const Divider(
              thickness: 5,
              color: Color(0xffF3F6F7),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AddCardScreen.routeName);
                },
                child: Row(
                  children: const [
                    Text(
                      "+ ",
                      style: TextStyle(
                        color: AppColors.appBlueColor,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Add Credit / Debit Card",
                      style: TextStyle(
                        fontFamily: kAppFont,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        color: AppColors.appBlueColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
