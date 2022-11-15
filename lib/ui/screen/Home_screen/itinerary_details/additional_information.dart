import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/shared/appbar.dart';

import '../controller/itinerary_detaile_screen _controller.dart';

class AdditionalInformationScreen extends StatefulWidget {
  static const String routeName = "/AdditionalInformationScreen";

  const AdditionalInformationScreen({Key? key}) : super(key: key);

  @override
  State<AdditionalInformationScreen> createState() =>
      _AdditionalInformationScreenState();
}

class _AdditionalInformationScreenState
    extends State<AdditionalInformationScreen> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Additional Information"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: SingleChildScrollView(
          child: GetBuilder(
            builder: (ItineraryDetailScreenController
                itineraryDetailScreenController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text(
                  //   "Heath & Safety",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20,
                  //   ),
                  // ),
                  // const Divider(thickness: 1),
                  labelHistory(
                    text: itineraryDetailScreenController
                            .itineraryDetailsListModel?.additionalInformation ??
                        "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text.",
                  ),
                  // labelText(
                  //     text: "COVID-19 Related Information/\nRestrictions"),
                  // labelHistory(
                  //   text:
                  //       "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text.",
                  // ),
                  // labelText(text: "VISA Regulations"),
                  // labelHistory(
                  //   text:
                  //       "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text.",
                  // ),
                  // labelText(text: "Required Immunizations"),
                  // labelHistory(
                  //   text:
                  //       "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text.",
                  // ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  labelText({required String text}) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  labelHistory({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
