import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/hotel_rservations_screen.dart';

import '../../../../custem_class/constant/app_colors.dart';
import '../../../../custem_class/constant/app_icons.dart';
import '../../../shared/appbar.dart';
import 'activity_map_details_screen.dart';

class RestaurantReservationsScreen extends StatefulWidget {
  static const String routeName = "/RestaurantReservationsScreen";

  const RestaurantReservationsScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantReservationsScreen> createState() =>
      _RestaurantReservationsScreenState();
}

class _RestaurantReservationsScreenState
    extends State<RestaurantReservationsScreen> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Restaurant Reservations"),
      body: SingleChildScrollView(
        child: GetBuilder(
          builder: (ItineraryDetailScreenController
              itineraryDetailScreenController) {
            return Column(
              children: [
                imageContainer(
                  context: context,
                  img: itineraryDetailScreenController.itinerary?.image ??
                      "https://res.cloudinary.com/culturemap-com/image/upload/ar_4:3,c_fill,g_faces:center,w_980/v1565881156/photos/300250_original.jpg",
                  text: itineraryDetailScreenController.itinerary?.name ??
                      "SALU, the Filipino Restaurant",
                ),
                const SizedBox(height: 35),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(thickness: 1.5),
                      detailTitle(text: "Date & Time"),
                      detailText(
                        text: itineraryDetailScreenController
                                .itinerary?.reservationDateTime
                                .toString() ??
                            "12-Nov-2022 | 11:30 AM",
                      ),
                      detailTitle(text: "Contact Number"),
                      detailText(
                        text: itineraryDetailScreenController
                                .itinerary?.contactNumber ??
                            "+62 361 769 2220",
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
                              "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text."),
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
