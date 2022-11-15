import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/train/train_ticket_preview_screen.dart';

import '../../../../../custem_class/constant/app_settings.dart';
import '../flight/flight_user_details.dart';

class TrainUserDetailsScreen extends StatefulWidget {
  const TrainUserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TrainUserDetailsScreen> createState() => _TrainUserDetailsScreenState();
}

class _TrainUserDetailsScreenState extends State<TrainUserDetailsScreen> {
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
                    "https://image.shutterstock.com/image-vector/vector-train-ticket-rail-pass-260nw-1228205155.jpg",
                ticketOnTap: () {
                  Get.toNamed(TrainTicketPreviewScreen.routeName);
                },
              );
            }),
      ),
    );
  }
}
