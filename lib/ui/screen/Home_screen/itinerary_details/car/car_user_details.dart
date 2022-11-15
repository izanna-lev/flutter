import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/car/car_ticket_preview_screen.dart';

import '../../../../../custem_class/constant/app_settings.dart';
import '../flight/flight_user_details.dart';

class CarUserDetailsScreen extends StatefulWidget {
  const CarUserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CarUserDetailsScreen> createState() => _CarUserDetailsScreenState();
}

class _CarUserDetailsScreenState extends State<CarUserDetailsScreen> {
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
                    "https://thumbs.dreamstime.com/z/parking-ticket-money-penalty-receipt-vector-illustration-isolated-park-car-check-paid-119769572.jpg",
                ticketOnTap: () {
                  Get.toNamed(CarTicketPreviewScreen.routeName);
                },
              );
            }),
      ),
    );
  }
}
