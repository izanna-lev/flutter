import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/flight/flight_ticket_preview_screen.dart';

import '../../controller/itinerary_detaile_screen _controller.dart';

class FlightUserDetails extends StatefulWidget {
  const FlightUserDetails({Key? key}) : super(key: key);

  @override
  State<FlightUserDetails> createState() => _FlightUserDetailsState();
}

class _FlightUserDetailsState extends State<FlightUserDetails> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return userDetails(
                name: itineraryDetailScreenController
                        .itinerary?.tickets[index].travellerName ??
                    "Smit Dhola",
                img: itineraryDetailScreenController
                        .itinerary?.tickets[index].ticketImage ??
                    "https://image.shutterstock.com/image-vector/pattern-airline-boarding-pass-ticket-260nw-375639655.jpg",
                ticketOnTap: () {
                  Get.toNamed(
                    FlightTicketPreviewScreen.routeName,
                    arguments: itineraryDetailScreenController
                            .itinerary?.tickets[index].ticketImage ??
                        'https://image.shutterstock.com/image-vector/pattern-airline-boarding-pass-ticket-260nw-375639655.jpg',
                  );
                },
              );
            }),
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
      GestureDetector(onTap: ticketOnTap, child: Image.network(img)),
      const SizedBox(height: 10),
    ],
  );
}
