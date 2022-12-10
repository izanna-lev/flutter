import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';

import '../../../../../custem_class/constant/app_icons.dart';
import '../../../../../custem_class/constant/app_settings.dart';
import '../flight/flight_details.dart';
import '../hotel_rservations_screen.dart';

class FerryDetails extends StatefulWidget {
  int index;
  var data = Get.arguments;
  FerryDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<FerryDetails> createState() => _FerryDetailsState();
}

class _FerryDetailsState extends State<FerryDetails> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  void initState() {
    widget.index;

    // TODO: implement initState
    super.initState();
  }

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
                  "Arrival Ferry Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                detailTitle(text: "Outbound"),
                detailText(
                  text:
                      "${itineraryDetailScreenController.itineraryDetailsListModel!.itinerary[widget.index].airline} | ${itineraryDetailScreenController.itineraryDetailsListModel!.itinerary[widget.index].arrivalLocation}",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailTitle(text: "Depart"),
                        detailText(
                          text: flightDepartDateAndTimeConverter(
                            itineraryDetailScreenController
                                .itineraryDetailsListModel!
                                .itinerary[widget.index]
                                .departDateTime,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailTitle(text: "Arrive"),
                        detailText(
                          text: flightDepartDateAndTimeConverter(
                            itineraryDetailScreenController
                                .itineraryDetailsListModel!
                                .itinerary[widget.index]
                                .arrivalDateTime,
                          ),
                        ),
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
                    detailText(
                      text: itineraryDetailScreenController
                          .itineraryDetailsListModel!
                          .itinerary[widget.index]
                          .transportDuration,
                    ),
                    const SizedBox(width: 10),
                    Image.asset(AppIcons.ferryTicketIcon, height: 14),
                    const SizedBox(width: 10),
                    detailText(
                      text: itineraryDetailScreenController
                                  .itineraryDetailsListModel!
                                  .itinerary[widget.index]
                                  .trainClass ==
                              1
                          ? "Standard Class"
                          : itineraryDetailScreenController
                                      .itineraryDetailsListModel!
                                      .itinerary[widget.index]
                                      .trainClass ==
                                  2
                              ? "Business Class"
                              : "",
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
                            detailTitle(text: ""
                                // '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[0].airline}',
                                ),
                            // const Text(
                            //   "SQ221",
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                flightText(
                                  text: flightDepartArriveTimeConverter(
                                    itineraryDetailScreenController
                                        .itineraryDetailsListModel!
                                        .itinerary[widget.index]
                                        .departDateTime,
                                  ),
                                ),
                                const SizedBox(height: 70),
                                flightText(
                                  text: flightDepartArriveTimeConverter(
                                    itineraryDetailScreenController
                                        .itineraryDetailsListModel!
                                        .itinerary[widget.index]
                                        .arrivalDateTime,
                                  ),
                                ),
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
                                        '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].departLocation}'
                                    // "Flight depart from canada"
                                    ),
                                const SizedBox(height: 70),
                                flightText(
                                    text:
                                        '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].arrivalLocation}')
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
                  "Departure Ferry Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1),
                detailTitle(text: "Outbound"),
                detailText(
                  text:
                      "${itineraryDetailScreenController.itineraryDetailsListModel!.itinerary[widget.index].airline} | ${itineraryDetailScreenController.itineraryDetailsListModel!.itinerary[widget.index].departLocation}",
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailTitle(text: "Depart"),
                        detailText(
                          text: flightDepartDateAndTimeConverter(
                            itineraryDetailScreenController
                                .itineraryDetailsListModel!
                                .itinerary[widget.index]
                                .departDateTime,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailTitle(text: "Arrive"),
                        detailText(
                          text: flightDepartDateAndTimeConverter(
                            itineraryDetailScreenController
                                .itineraryDetailsListModel!
                                .itinerary[widget.index]
                                .arrivalDateTime,
                          ),
                        ),
                      ],
                    ),
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
