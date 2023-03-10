import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/ferrry/ferry_ticket_preview_screen.dart';

import '../../../../../custem_class/constant/app_settings.dart';
import '../flight/flight_user_details.dart';

class FerryUserDetails extends StatefulWidget {
  int index;
  var data = Get.arguments;

  FerryUserDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<FerryUserDetails> createState() => _FerryUserDetailsState();
}

class _FerryUserDetailsState extends State<FerryUserDetails> {
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
              print(
                  'FERRY----->${itineraryDetailScreenController
                      .itineraryDetailsListModel!.itinerary[widget.index]
                      .tickets}');
              return itineraryDetailScreenController.itineraryDetailsListModel!
                  .itinerary[widget.index].tickets.isNotEmpty
                  ? ListView.builder(
                  itemCount: itineraryDetailScreenController
                      .itineraryDetailsListModel!
                      .itinerary[widget.index]
                      .tickets
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    print(
                        'FERRY-LENGTH--->${itineraryDetailScreenController
                            .itineraryDetailsListModel!.itinerary[widget.index]
                            .tickets[index].name}');
                    return userDetails(
                      index: index + 1,
                      name: itineraryDetailScreenController
                          .itineraryDetailsListModel!
                          .itinerary[widget.index]
                          .tickets[index]
                          .name,
                      img:
                      '$imageUrl${itineraryDetailScreenController
                          .itineraryDetailsListModel!.itinerary[widget.index]
                          .tickets[index].image}',
                      ticketOnTap: () {
                        Get.toNamed(
                          FerryTicketPreviewScreen.routeName,
                          arguments: itineraryDetailScreenController
                              .itineraryDetailsListModel!
                              .itinerary[widget.index]
                              .tickets[index]
                              .image,
                        );
                      },
                    );
                  })
                  : Center(child: Text("No data found"));
            },
          ),
        ),
      ),
    );
  }
}
