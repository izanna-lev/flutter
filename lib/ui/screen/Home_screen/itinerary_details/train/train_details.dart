import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';

import '../../../../../custem_class/constant/app_icons.dart';
import '../../../../../custem_class/constant/app_settings.dart';
import '../flight/flight_details.dart';
import '../hotel_rservations_screen.dart';

class TrainDetails extends StatefulWidget {
  int index;
  var data = Get.arguments;
  TrainDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<TrainDetails> createState() => _TrainDetailsState();
}

class _TrainDetailsState extends State<TrainDetails> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: SingleChildScrollView(
        child: GetBuilder(
          builder: (ItineraryDetailScreenController
              itineraryDetailScreenController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Arrival Train Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                detailTitle(text: "Outbound"),
                detailText(
                  text: itineraryDetailScreenController
                          .itineraryDetailsListModel
                          ?.itinerary[widget.index]
                          .name ??
                      "Philippines Train | Canda - Cebu City",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailTitle(text: "Depart"),
                        detailText(
                            text: dateAndTimeConverter(
                                itineraryDetailScreenController
                                    .itineraryDetailsListModel!
                                    .itinerary[0]
                                    .date)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailTitle(text: "Arrive"),
                        detailText(
                            text: dateAndTimeConverter(
                                itineraryDetailScreenController
                                    .itineraryDetailsListModel!
                                    .itinerary[0]
                                    .date)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      color: Colors.black54,
                      size: 14,
                    ),
                    const SizedBox(width: 10),
                    detailText(text: "4hrs 30 min"),
                    const SizedBox(width: 10),
                    Image.asset(AppIcons.trainTicketIcon, height: 14),
                    const SizedBox(width: 10),
                    detailText(
                      text: itineraryDetailScreenController
                                  .itineraryDetailsListModel
                                  ?.itinerary[widget.index]
                                  .trainClass ==
                              1
                          ? "STANDARD"
                          : itineraryDetailScreenController
                                      .itineraryDetailsListModel
                                      ?.itinerary[widget.index]
                                      .flightClass ==
                                  2
                              ? "BUSINESS"
                              : "" ?? "Economy Class",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffedf4f8),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            detailTitle(
                              text:
                                  '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[0].airline}',
                            ),
                            const Text(
                              "SQ221",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                flightText(text: "02:00 AM"),
                                const SizedBox(height: 70),
                                flightText(text: "06:30 PM"),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(AppIcons.startFlightIcon,
                                    height: 17),
                                Container(
                                  height: 75,
                                  width: 1.5,
                                  color: Colors.grey,
                                ),
                                Image.asset(AppIcons.ebdFlightIcon, height: 17),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                flightText(
                                    text:
                                        '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[0].location}'),
                                const SizedBox(height: 70),
                                flightText(
                                    text:
                                        '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[0].location}'
                                    // itineraryDetailScreenController
                                    //         .itinerary?.name ??
                                    //     "Train arrives in cebu city",
                                    )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Departure Train Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1),
                detailTitle(text: "Outbound"),
                detailText(
                    text: itineraryDetailScreenController
                            .itineraryDetailsListModel
                            ?.itinerary[widget.index]
                            .name
                            .toString() ??
                        "Philippines Train | Caticlan - Canada"),
                const SizedBox(height: 10),
                Row(
                  children: [
                    detailTitle(text: "Depart"),
                    const Spacer(),
                    detailTitle(text: "Arrive"),
                    const Spacer(),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
