import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';

import '../../../../custem_class/constant/app_colors.dart';
import '../../../../custem_class/constant/app_icons.dart';
import '../../../../custem_class/constant/app_settings.dart';
import '../../../shared/appbar.dart';
import 'activity_map_details_screen.dart';
import 'hotel_rservations_screen.dart';

class ActivityDetailsScreen extends StatefulWidget {
  static const String routeName = "/ActivityDetailsScreen";

  const ActivityDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ActivityDetailsScreen> createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Activity Details"),
      body: SingleChildScrollView(
        child: GetBuilder(
          builder: (ItineraryDetailScreenController
              itineraryDetailScreenController) {
            return Column(
              children: [
                imageContainer(
                  context: context,
                  img: itineraryDetailScreenController.itinerary?.image ??
                      "https://storage.googleapis.com/fvallimages/uploads/blog/best-beaches-in-malaysia-2699.jpg",
                  text: itineraryDetailScreenController.itinerary?.name ??
                      "Seco Island - Full Day Tour",
                ),
                const SizedBox(height: 35),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(thickness: 1.5),
                      detailTitle(text: "Check Out Date & Time"),
                      detailText(
                        text: itineraryDetailScreenController
                                .itinerary?.reservationDateTime
                                .toString() ??
                            "13-Nov-2022 | 12:00 PM",
                      ),
                      detailTitle(text: "Location"),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(ActivityMapDetails.routeName);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              detailText(
                                  text: itineraryDetailScreenController
                                          .itinerary?.location
                                          .toString() ??
                                      "Cebu City, Philippines"),
                              Image.asset(AppIcons.gpsIcon, height: 21),
                            ],
                          ),
                        ),
                      ),
                      detailTitle(text: "Description"),
                      detailText(
                        text: itineraryDetailScreenController
                                .itinerary?.description ??
                            "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text.",
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
