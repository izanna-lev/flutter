import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';

import '../../../../custem_class/constant/app_icons.dart';
import '../../../../custem_class/constant/app_settings.dart';
import '../../../shared/appbar.dart';
import 'activity_map_details_screen.dart';
import 'hotel_rservations_screen.dart';

class ActivityDetailsScreen extends StatefulWidget {
  static const String routeName = "/ActivityDetailsScreen";

  ActivityDetailsScreen({Key? key}) : super(key: key);
  var index = Get.arguments;

  @override
  State<ActivityDetailsScreen> createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  void initState() {
    widget.index;
    print('ACTIVITY_DETAILS_INDEX---->${widget.index}');
    print(
        'ACTIVITY_DETAILS_INDEX----> Description${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[0].description}');

    super.initState();
  }

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
                  img: imageUrl +
                      '${itineraryDetailScreenController.itineraryDetailsListModel!.itinerary[widget.index].image}',
                  // ?? "https://storage.googleapis.com/fvallimages/uploads/blog/best-beaches-in-malaysia-2699.jpg",
                  text: itineraryDetailScreenController
                          .itineraryDetailsListModel
                          ?.itinerary[widget.index]
                          .name ??
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
                          text: hotelDateAndTimeConverter(
                              itineraryDetailScreenController
                                  .itineraryDetailsListModel!
                                  .itinerary[widget.index]
                                  .date)),
                      detailTitle(text: "Location"),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            ActivityMapDetails.routeName,
                            arguments: [
                              itineraryDetailScreenController
                                  .itineraryDetailsListModel
                                  ?.itinerary[widget.index]
                                  .image,
                              '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].coordinates[0]}',
                              '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].coordinates[1]}',
                              '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].location}',
                              '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].name}',
                              itineraryDetailScreenController
                                  .itineraryDetailsListModel!
                                  .itinerary[widget.index]
                                  .detailType
                            ],
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              detailText(
                                  text: itineraryDetailScreenController
                                      .itineraryDetailsListModel!
                                      .itinerary[widget.index]
                                      .location),
                              Image.asset(AppIcons.gpsIcon, height: 21),
                            ],
                          ),
                        ),
                      ),
                      detailTitle(text: "Description"),
                      detailText(
                        text: itineraryDetailScreenController
                            .itineraryDetailsListModel!
                            .itinerary[widget.index]
                            .description,
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
