import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_images.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/flight/flight_ticket_preview_screen.dart';

import '../../controller/itinerary_detaile_screen _controller.dart';

class FlightUserDetails extends StatefulWidget {
  int index;
  var data = Get.arguments;
  FlightUserDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<FlightUserDetails> createState() => _FlightUserDetailsState();
}

class _FlightUserDetailsState extends State<FlightUserDetails> {
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
                      .itineraryDetailsListModel
                      ?.itinerary[widget.index]
                      .tickets
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    return userDetails(
                      name:
                          '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].tickets[index].name}',
                      // ?? "Smit Dhola"
                      img: imageUrl +
                          '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[widget.index].tickets[index].image}',
                      // itineraryDetailScreenController
                      //         .itinerary?.tickets[index].image ??
                      // "https://image.shutterstock.com/image-vector/pattern-airline-boarding-pass-ticket-260nw-375639655.jpg",
                      ticketOnTap: () {
                        Get.toNamed(FlightTicketPreviewScreen.routeName,
                            arguments: itineraryDetailScreenController
                                .itineraryDetailsListModel
                                ?.itinerary[widget.index]
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

userDetails({
  required String name,
  required String img,
  required void Function() ticketOnTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "User 1 Details",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      const Divider(thickness: 2),
      const Text(
        "Name",
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
        "Ticket",
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
