import 'package:flutter/material.dart';

import '../../../../shared/appbar.dart';

class TrainTicketPreviewScreen extends StatefulWidget {
  static const String routeName = "/TrainTicketPreviewScreen";
  const TrainTicketPreviewScreen({Key? key}) : super(key: key);

  @override
  State<TrainTicketPreviewScreen> createState() =>
      _TrainTicketPreviewScreenState();
}

class _TrainTicketPreviewScreenState extends State<TrainTicketPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Ticket Preview"),
      body: Center(
        child: Image.network(
            "https://image.shutterstock.com/image-vector/vector-train-ticket-rail-pass-260nw-1228205155.jpg"),
      ),
    );
  }
}
