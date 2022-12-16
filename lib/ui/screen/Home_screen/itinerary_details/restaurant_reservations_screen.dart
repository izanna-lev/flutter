// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tralever_module/custem_class/constant/app_settings.dart';
// import 'package:tralever_module/custem_class/utils/globle.dart';
// import 'package:tralever_module/services/api_routes.dart';
// import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
// import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/hotel_rservations_screen.dart';
//
// import '../../../../custem_class/constant/app_icons.dart';
// import '../../../shared/appbar.dart';
// import 'activity_map_details_screen.dart';
//
// class RestaurantReservationsScreen extends StatefulWidget {
//   static const String routeName = "/RestaurantReservationsScreen";
//
//   RestaurantReservationsScreen({Key? key}) : super(key: key);
//   var index = Get.arguments;
//
//   @override
//   State<RestaurantReservationsScreen> createState() =>
//       _RestaurantReservationsScreenState();
// }
//
// class _RestaurantReservationsScreenState
//     extends State<RestaurantReservationsScreen> {
//   ItineraryDetailScreenController itineraryDetailScreenController =
//       Get.find<ItineraryDetailScreenController>();
//   @override
//   void initState() {
//     widget.index;
//     print('RESTAURANT_RESERVATIONS_INDEX===>${widget.index}');
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: commonAppbar(titleText: "Restaurant Reservations"),
//       body: SingleChildScrollView(
//         child: GetBuilder(
//           builder: (ItineraryDetailScreenController
//               itineraryDetailScreenController) {
//             return Column(
//               children: [
//                 imageContainer(
//                   context: context,
//                   img:
//                       '$imageUrl${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].image}',
//                   text: itineraryDetailScreenController
//                       .itineraryDetailsListModel!.itinerary[widget.index].name,
//                 ),
//                 const SizedBox(height: 35),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Divider(thickness: 1.5),
//                       detailTitle(text: "Date & Time"),
//                       detailText(
//                           text: hotelDateAndTimeConverter(
//                               '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].date.toString()}')),
//                       detailTitle(text: "Contact Number"),
//                       detailText(
//                         text: itineraryDetailScreenController
//                             .itineraryDetailsListModel!
//                             .itinerary[widget.index]
//                             .contactNumber,
//                       ),
//                       detailTitle(text: "Location"),
//                       GestureDetector(
//                         onTap: () {
//                           Get.toNamed(
//                             ActivityMapDetails.routeName,
//                             arguments: [
//                               itineraryDetailScreenController
//                                   .itineraryDetailsListModel
//                                   ?.itinerary[widget.index]
//                                   .image,
//                               '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].coordinates[0]}',
//                               '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].coordinates[1]}',
//                               '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].location}',
//                               '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].name}',
//                               itineraryDetailScreenController
//                                   .itineraryDetailsListModel!
//                                   .itinerary[widget.index]
//                                   .detailType
//                             ],
//                           );
//                         },
//                         child: Container(
//                           color: Colors.transparent,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: detailText(
//                                     text: itineraryDetailScreenController
//                                         .itineraryDetailsListModel!
//                                         .itinerary[widget.index]
//                                         .location),
//                               ),
//                               Image.asset(
//                                 AppIcons.gpsIcon,
//                                 height: 21,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       detailTitle(text: "Description"),
//                       detailText(
//                           text: itineraryDetailScreenController
//                                   .itineraryDetailsListModel
//                                   ?.itinerary[widget.index]
//                                   .description ??
//                               "Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standard dummy text."),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/hotel_rservations_screen.dart';

import '../../../../custem_class/constant/app_icons.dart';
import '../../../../custem_class/utils/globle.dart';
import '../../../shared/appbar.dart';
import 'activity_map_details_screen.dart';

class RestaurantReservationsScreen extends StatefulWidget {
  static const String routeName = "/RestaurantReservationsScreen";

  RestaurantReservationsScreen({Key? key}) : super(key: key);
  var index = Get.arguments;

  @override
  State<RestaurantReservationsScreen> createState() =>
      _RestaurantReservationsScreenState();
}

class _RestaurantReservationsScreenState
    extends State<RestaurantReservationsScreen> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  void initState() {
    widget.index;
    super.initState();
  }

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
                      detailTitle(text: "Date & Time"),
                      detailText(
                          text: hotelDateAndTimeConverter(
                              itineraryDetailScreenController
                                  .itineraryDetailsListModel!
                                  .itinerary[widget.index]
                                  .date)),
                      detailTitle(text: "Contact Number"),
                      detailText(
                        text:
                            "${itineraryDetailScreenController.itineraryDetailsListModel!.itinerary[widget.index].phoneCode} ${itineraryDetailScreenController.itineraryDetailsListModel!.itinerary[widget.index].contactNumber}",
                      ),
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
                              Expanded(
                                child: detailText(
                                    text: itineraryDetailScreenController
                                        .itineraryDetailsListModel!
                                        .itinerary[widget.index]
                                        .location),
                              ),
                              Image.asset(
                                AppIcons.gpsIcon,
                                height: 21,
                              )
                            ],
                          ),
                        ),
                      ),
                      detailTitle(text: "Description"),
                      detailText(
                          text: itineraryDetailScreenController
                                  .itineraryDetailsListModel
                                  ?.itinerary[widget.index]
                                  .description ??
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
