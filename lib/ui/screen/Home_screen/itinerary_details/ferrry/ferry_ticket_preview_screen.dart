import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/appbar.dart';

class FerryTicketPreviewScreen extends StatefulWidget {
  static const String routeName = "/FerryTicketPreviewScreen";

  FerryTicketPreviewScreen({Key? key}) : super(key: key);
  // var data = Get.arguments;

  @override
  State<FerryTicketPreviewScreen> createState() =>
      _FerryTicketPreviewScreenState();
}

class _FerryTicketPreviewScreenState extends State<FerryTicketPreviewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Ticket Preview"),
      body: Center(
        child: Image.network(
          //Get.arguments,
          "https://image.shutterstock.com/image-vector/ticket-ferry-boat-transportation-isolated-260nw-458092201.jpg",
        ),
      ),
    );
  }
}
