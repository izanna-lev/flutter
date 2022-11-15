import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../custem_class/constant/app_icons.dart';
import '../../../../../custem_class/constant/app_settings.dart';
import '../../controller/itinerary_detaile_screen _controller.dart';
import '../flight/flight_details.dart';
import '../hotel_rservations_screen.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({Key? key}) : super(key: key);

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
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
                  "Arrival Car Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                detailTitle(text: "Outbound"),
                detailText(
                  text: itineraryDetailScreenController.itinerary?.name ??
                      "Philippines Car | Canda - Cebu City",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailTitle(text: "Depart"),
                        detailText(
                          text: itineraryDetailScreenController
                                  .itinerary?.departDateTime
                                  .toString() ??
                              "12-Nov-2022 | 11:30\nPM",
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        detailTitle(text: "Arrive"),
                        detailText(
                          text: itineraryDetailScreenController
                                  .itinerary?.arrivalDateTime
                                  .toString() ??
                              "13-Nov-2022 | 09:00\nAM",
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
                    Image.asset(AppIcons.carTicketIcon, height: 14),
                    const SizedBox(width: 10),
                    detailText(
                      text: itineraryDetailScreenController
                              .itinerary?.flightClass
                              .toString() ??
                          "Economy Class",
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
                            detailTitle(text: "Philippines Car"),
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
                                flightText(text: "Car depart from canada"),
                                const SizedBox(height: 70),
                                flightText(text: "Car arrives in cebu city")
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
                  "Departure Car Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1),
                detailTitle(text: "Outbound"),
                detailText(
                  text: itineraryDetailScreenController.itinerary?.name ??
                      "Philippines Car | Caticlan - Canada",
                ),
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
