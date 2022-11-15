import 'package:flutter/material.dart';

import '../../../../shared/appbar.dart';

class CarTicketPreviewScreen extends StatefulWidget {
  static const String routeName = "/CarTicketPreviewScreen";

  const CarTicketPreviewScreen({Key? key}) : super(key: key);

  @override
  State<CarTicketPreviewScreen> createState() => _CarTicketPreviewScreenState();
}

class _CarTicketPreviewScreenState extends State<CarTicketPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Ticket Preview"),
      body: Center(
        child: Image.network(
            "https://thumbs.dreamstime.com/z/parking-ticket-money-penalty-receipt-vector-illustration-isolated-park-car-check-paid-119769572.jpg"),
      ),
    );
  }
}
