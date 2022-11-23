import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tralever_module/services/api_routes.dart';

import '../../../../shared/appbar.dart';

class CarTicketPreviewScreen extends StatefulWidget {
  static const String routeName = "/CarTicketPreviewScreen";

  CarTicketPreviewScreen({Key? key}) : super(key: key);
  var data = Get.arguments;

  @override
  State<CarTicketPreviewScreen> createState() => _CarTicketPreviewScreenState();
}

class _CarTicketPreviewScreenState extends State<CarTicketPreviewScreen> {
  @override
  void initState() {
    widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: commonAppbar(titleText: "Ticket Preview"),
        body: Center(
          child: Image.network(imageUrl + widget.data
              // "https://thumbs.dreamstime.com/z/parking-ticket-money-penalty-receipt-vector-illustration-isolated-park-car-check-paid-119769572.jpg"),
              ),
        ));
  }
}
