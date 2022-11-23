import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/shared/appbar.dart';

class FlightTicketPreviewScreen extends StatefulWidget {
  static const String routeName = "/TicketPreviewScreen";

  FlightTicketPreviewScreen({Key? key}) : super(key: key);
  var data = Get.arguments;

  @override
  State<FlightTicketPreviewScreen> createState() =>
      _FlightTicketPreviewScreenState();
}

class _FlightTicketPreviewScreenState extends State<FlightTicketPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Ticket Preview"),
      body: Center(
        child: Image.network(
          imageUrl + widget.data,
          //"https://image.shutterstock.com/image-vector/pattern-airline-boarding-pass-ticket-260nw-375639655.jpg",
        ),
      ),
    );
  }
}
