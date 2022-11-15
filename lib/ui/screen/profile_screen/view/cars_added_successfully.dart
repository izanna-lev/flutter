import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/shared/material_button.dart';

class CardAddedSuccessfully extends StatefulWidget {
  static const String routeName = "/CardAddedSuccessfully";

  const CardAddedSuccessfully({Key? key}) : super(key: key);

  @override
  State<CardAddedSuccessfully> createState() => _CardAddedSuccessfullyState();
}

class _CardAddedSuccessfullyState extends State<CardAddedSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Card Added",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(AppIcons.cardAddIcon, height: 125),
            const SizedBox(height: 20),
            const Text(
              "Added Successfully",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Your card has been\n added successfully.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            materialButton(
                onTap: () {
                  Get.back();
                  Get.back();
                },
                text: "Back to Settings"),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
