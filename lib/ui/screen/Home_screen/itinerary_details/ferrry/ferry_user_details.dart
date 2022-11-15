import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/ferrry/ferry_ticket_preview_screen.dart';

import '../../../../../custem_class/constant/app_settings.dart';
import '../flight/flight_user_details.dart';

class FerryUserDetails extends StatefulWidget {
  const FerryUserDetails({Key? key}) : super(key: key);

  @override
  State<FerryUserDetails> createState() => _FerryUserDetailsState();
}

class _FerryUserDetailsState extends State<FerryUserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return userDetails(
                name: "Smit Dhola",
                img:
                    "https://image.shutterstock.com/image-vector/ticket-ferry-boat-transportation-isolated-260nw-458092201.jpg",
                ticketOnTap: () {
                  Get.toNamed(FerryTicketPreviewScreen.routeName);
                },
              );
            }),
      ),
    );
  }
}
