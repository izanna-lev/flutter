import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';

import '../../../../../custem_class/constant/app_icons.dart';
import '../../../../../custem_class/constant/app_settings.dart';
import '../../controller/itinerary_detaile_screen _controller.dart';
import '../flight/flight_details.dart';
import '../hotel_rservations_screen.dart';

class CarDetails extends StatefulWidget {
  int index;
  var data = Get.arguments;
  CarDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  void initState() {
    widget.index;
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
                SizedBox(height: 15,),
                const Text(
                  "Departure Car Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Divider(thickness: 1),
                detailTitle(text: "Outbound"),
                detailText(
                  text: itineraryDetailScreenController
                      .itineraryDetailsListModel!
                      .itinerary[widget.index]
                      .departLocation,
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
                                .itinerary[widget.data]
                                .departDateTime
                                .toString(),
                          ),
                        ),
                      ],
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     detailTitle(text: "Arrive"),
                    //     detailText(
                    //       text: flightDepartDateAndTimeConverter(
                    //         itineraryDetailScreenController
                    //             .itineraryDetailsListModel!
                    //             .itinerary[widget.index]
                    //             .departDateTime
                    //             .toString(),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
               //   height: 180,
                  padding: EdgeInsets.only(bottom: 24),
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
                              // '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[0].airline}'
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
                                        .itinerary[widget.data]
                                        .departDateTime,
                                  ),
                                ),
                                const SizedBox(height: 70),

                                /// not come from backend
                                // flightText(text: "06:30 PM"),
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: SizedBox(
                                    width: Get.width * 0.55,
                                    child: flightText(
                                      text: itineraryDetailScreenController
                                          .itineraryDetailsListModel!
                                          .itinerary[widget.index]
                                          .departLocation),
                                  ),
                                ),
                                const SizedBox(height: 60),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: SizedBox(
                                    width: Get.width * 0.55,
                                    child: flightText(
                                      text: itineraryDetailScreenController
                                          .itineraryDetailsListModel!
                                          .itinerary[widget.index]
                                          .arrivalLocation)
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailTitle(
                        text: "Notes"
                    ),
                    detailText(
                      text:  itineraryDetailScreenController
                            .itineraryDetailsListModel!
                            .itinerary[widget.data]
                            .specialistNote.toString()
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
