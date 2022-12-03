import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/hotel_rservations_screen.dart';

class FlightDetail extends StatefulWidget {
  int index;
  var data = Get.arguments;
  FlightDetail({Key? key, required this.index}) : super(key: key);

  @override
  State<FlightDetail> createState() => _FlightDetailState();
}

class _FlightDetailState extends State<FlightDetail> {
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
                  "Arrival Flight Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                detailTitle(
                  text: "Outbound",
                ),
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
                                .departDateTime
                                .toString(),
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
                                .arrivalDateTime
                                .toString(),
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
                    detailText(text: "4hrs 30 min"),
                    const SizedBox(width: 10),
                    Image.asset(AppIcons.flightTicketIcon, height: 14),
                    const SizedBox(width: 10),
                    detailText(
                      text: itineraryDetailScreenController
                                  .itineraryDetailsListModel
                                  ?.itinerary[0]
                                  .flightClass ==
                              1
                          ? "BUSINESS"
                          : itineraryDetailScreenController
                                      .itineraryDetailsListModel
                                      ?.itinerary[0]
                                      .flightClass ==
                                  2
                              ? "ECONOMY"
                              : "FIRST CLASS",
                    )
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
                              text: itineraryDetailScreenController


                                  .itineraryDetailsListModel!
                                  .itinerary[widget.index]
                                  .airline,
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
                                        .departDateTime
                                        .toString(),
                                  ),
                                ),
                                const SizedBox(height: 70),
                                flightText(
                                  text: flightDepartArriveTimeConverter(
                                    itineraryDetailScreenController
                                        .itineraryDetailsListModel!
                                        .itinerary[widget.index]
                                        .arrivalDateTime
                                        .toString(),
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
                  "Departure Flight Details",
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
                                .departDateTime
                                .toString(),
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
                                .arrivalDateTime
                                .toString(),
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

flightText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );
}
