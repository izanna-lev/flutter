import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_images.dart';
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
                'bhfbgbdbvdfvd${itineraryDetailScreenController
                    .itineraryDetailsListModel?.itinerary[widget.index]
                    .userCarDetails?.driverName}');
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

              carUserDetails(
                name:
                '${itineraryDetailScreenController.itineraryDetailsListModel
                    ?.itinerary[widget.index].userCarDetails?.driverName}',
                img: imageUrl +
                    '${itineraryDetailScreenController.itineraryDetailsListModel
                        ?.itinerary[widget.index].userCarDetails?.carImage}',
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

carUserDetails({
  required String name,
  required String img,
  required void Function() ticketOnTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Details',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      const Divider(thickness: 2),
      const Text(
        "Company Name",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
      const SizedBox(height: 10),
      const Text(
        "Car",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 10),
      GestureDetector(
          onTap: ticketOnTap,
          child: Container(
              height: 150,
              width: double.infinity,
              child: img.isNotEmpty
                  ? Image.network(img)
                  : Image.asset(AppImages.placeHolderImage))),
      const SizedBox(height: 10),
    ],
  );
}