import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/car/car_ticket_preview_screen.dart';

import '../../../../../custem_class/constant/app_settings.dart';
import '../flight/flight_user_details.dart';

class CarUserDetailsScreen extends StatefulWidget {
  int index;
  var data = Get.arguments;
  CarUserDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<CarUserDetailsScreen> createState() => _CarUserDetailsScreenState();
}

class _CarUserDetailsScreenState extends State<CarUserDetailsScreen> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: GetBuilder(
          builder: (ItineraryDetailScreenController
              itineraryDetailScreenController) {
            print(
                'bhfbgbdbvdfvd${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].userCarDetails?.driverName}');
            return
                // ListView.builder(
                //   itemCount: itineraryDetailScreenController
                //       .itineraryDetailsListModel
                //       ?.itinerary[widget.index]
                //       .userCarDetails
                //       ?.driverName
                //       .length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return userDetails(
                //       name:
                //           '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[index].userCarDetails?.driverName}',
                //       img: imageUrl +
                //           '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[index].userCarDetails?.carImage}',
                //       ticketOnTap: () {
                //         Get.toNamed(CarTicketPreviewScreen.routeName,
                //             arguments: itineraryDetailScreenController
                //                 .itineraryDetailsListModel
                //                 ?.itinerary[index]
                //                 .userCarDetails
                //                 ?.carImage);
                //       },
                //     );
                //   });

                userDetails(
              name:
                  '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].userCarDetails?.driverName}',
              img: imageUrl +
                  '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].userCarDetails?.carImage}',
              ticketOnTap: () {
                Get.toNamed(CarTicketPreviewScreen.routeName,
                    arguments: itineraryDetailScreenController
                        .itineraryDetailsListModel
                        ?.itinerary[widget.index]
                        .userCarDetails
                        ?.carImage);
              },
            );
          },
        ),
      ),
    );
  }
}
