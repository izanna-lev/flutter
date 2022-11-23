import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/services/api_routes.dart';

import '../../../../shared/appbar.dart';

class TrainTicketPreviewScreen extends StatefulWidget {
  static const String routeName = "/TrainTicketPreviewScreen";

  TrainTicketPreviewScreen({Key? key}) : super(key: key);
  var data = Get.arguments;

  @override
  State<TrainTicketPreviewScreen> createState() =>
      _TrainTicketPreviewScreenState();
}

class _TrainTicketPreviewScreenState extends State<TrainTicketPreviewScreen> {
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
            // "https://image.shutterstock.com/image-vector/vector-train-ticket-rail-pass-260nw-1228205155.jpg"
            ),
      ),
    );
  }
}
