import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';

import '../../../../custem_class/constant/app_settings.dart';
import '../../../shared/appbar.dart';
import 'hotel_rservations_screen.dart';

class RequiredInformationScreen extends StatefulWidget {
  static const String routeName = "/RequiredInformationScreen";

  const RequiredInformationScreen({Key? key}) : super(key: key);

  @override
  State<RequiredInformationScreen> createState() =>
      _RequiredInformationScreenState();
}

class _RequiredInformationScreenState extends State<RequiredInformationScreen> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Required Information"),
      body: SingleChildScrollView(
        child: GetBuilder(
          builder: (ItineraryDetailScreenController
              itineraryDetailScreenController) {
            return Column(
              children: [
                imageContainer(
                  context: context,
                  img: itineraryDetailScreenController.itinerary?.image ??
                      "https://burst.shopifycdn.com/photos/city-landscape-at-night.jpg?width=1200&format=pjpg&exif=1&iptc=1",
                  text: "Notes",
                ),
                const SizedBox(height: 35),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(thickness: 1.5),
                      detailText(
                        text: itineraryDetailScreenController
                                .itinerary?.description ??
                            "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text. Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text.",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
