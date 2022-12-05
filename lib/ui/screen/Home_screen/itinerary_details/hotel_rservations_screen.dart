import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/activity_map_details_screen.dart';

import '../../../../custem_class/constant/app_settings.dart';
import '../../../../custem_class/utils/globle.dart';
import '../../../shared/appbar.dart';

class HotelReservationsScreen extends StatefulWidget {
  static const String routeName = "/HotelReservationsScreen";

  HotelReservationsScreen({Key? key}) : super(key: key);
  var index = Get.arguments;

  @override
  State<HotelReservationsScreen> createState() =>
      _HotelReservationsScreenState();
}

class _HotelReservationsScreenState extends State<HotelReservationsScreen> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  void initState() {
    widget.index;
    print('HOTEL_RESERVATION_INDEX==>${widget.index}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Hotel Reservations"),
      body: SingleChildScrollView(
        child: GetBuilder(
          builder: (ItineraryDetailScreenController
              itineraryDetailScreenController) {
            return Column(
              children: [
                imageContainer(
                  context: context,
                  img:
                      '$imageUrl${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].image}',
                  text: itineraryDetailScreenController
                      .itineraryDetailsListModel!.itinerary[widget.index].name,
                ),
                const SizedBox(height: 35),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(thickness: 1.5),
                      detailTitle(text: "Check In Date & Time"),
                      detailText(
                          text: hotelDateAndTimeConverter(
                              itineraryDetailScreenController
                                  .itineraryDetailsListModel!
                                  .itinerary[widget.index]
                                  .checkInDateTime)),
                      detailTitle(text: "Check Out Date & Time"),
                      detailText(
                          text: itineraryDetailScreenController
                                  .itineraryDetailsListModel!
                                  .itinerary[widget.index]
                                  .checkOutDateTime
                                  .isEmpty
                              ? ""
                              : hotelDateAndTimeConverter(
                                  itineraryDetailScreenController
                                      .itineraryDetailsListModel!
                                      .itinerary[widget.index]
                                      .checkOutDateTime)),
                      detailTitle(text: "Contact Number"),
                      detailText(
                          text: itineraryDetailScreenController
                                  .itineraryDetailsListModel
                                  ?.itinerary[widget.index]
                                  .contactNumber
                                  .toString() ??
                              "+62 361 769 2220"),
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
                                .itineraryDetailsListModel
                                ?.itinerary[widget.index]
                                .description
                                .toString() ??
                            "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text.",
                      )
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

imageContainer({
  required BuildContext context,
  required String img,
  required String text,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              img,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: 190,
        child: Container(
          //height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

detailTitle({required String text}) {
  return Column(
    children: [
      const SizedBox(height: 10),
      Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}

detailText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 15,
      color: Colors.black54,
      fontWeight: FontWeight.w500,
    ),
  );
}
