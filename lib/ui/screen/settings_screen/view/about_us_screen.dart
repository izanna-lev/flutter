import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/ui/shared/appbar.dart';

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
      appBar: commonAppbar(titleText: "About Us"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder(
          builder: (AboutScreenController aboutScreenController) {
            return
                // aboutScreenController.appDetailDataModel!.aboutUs == ""
                //   ? const Center(
                //       child: CircularProgressIndicator(
                //       strokeWidth: 2,
                //     ))
                //   :
                SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      aboutScreenController.appDetailDataModel?.aboutUs
                              .toString() ??
                          "",
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
}
