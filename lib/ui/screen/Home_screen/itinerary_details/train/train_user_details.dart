import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/train/train_ticket_preview_screen.dart';

import '../../../../../custem_class/constant/app_settings.dart';
import '../flight/flight_user_details.dart';

class TrainUserDetailsScreen extends StatefulWidget {
  int index;
  var data = Get.arguments;
  TrainUserDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<TrainUserDetailsScreen> createState() => _TrainUserDetailsScreenState();
}

class _TrainUserDetailsScreenState extends State<TrainUserDetailsScreen> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: GetBuilder(
            builder: (ItineraryDetailScreenController
                itineraryDetailScreenController) {
              return ListView.builder(
                  itemCount: itineraryDetailScreenController
                      .itineraryDetailsListModel?.itinerary[0].tickets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return userDetails(
                      name:
                          '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[0].tickets[index].name}',
                      img: imageUrl +
                          '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[0].tickets[index].image}',
                      // "https://image.shutterstock.com/image-vector/vector-train-ticket-rail-pass-260nw-1228205155.jpg",
                      ticketOnTap: () {
                        Get.toNamed(TrainTicketPreviewScreen.routeName,
                            arguments: itineraryDetailScreenController
                                .itineraryDetailsListModel
                                ?.itinerary[index]
                                .tickets[index]
                                .image);
                      },
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
