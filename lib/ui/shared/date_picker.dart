import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../screen/Home_screen/controller/itinerary_request_form_controller.dart';

class DemoDatePiker extends StatefulWidget {

  final String hintText;
  final TextEditingController controller;
  final VoidCallback? ontap;

  const DemoDatePiker({super.key,
    required this.hintText, required this.controller, required this.ontap});



  @override
  State<StatefulWidget> createState() {
    return DatePickerState();
  }
}

class DatePickerState extends State<DemoDatePiker> {
  //TextEditingController dateInput = TextEditingController();
  ItineraryRequestFormController itineraryRequestFormController =
      Get.find<ItineraryRequestFormController>();

  @override
  void initState() {
    itineraryRequestFormController.dateInput.text =
        ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextFormField(
      controller: widget.controller,
      style: TextStyle(
        fontSize: 13
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 13
        ),
        border: InputBorder.none,
        filled: true,
        fillColor: Color(0xffEDEDED),

        // enabledBorder: OutlineInputBorder(
        //      borderSide: BorderSide(color: AppColors.appBlueColor), //<-- SEE HERE
        //     ),
        // focusedBorder: OutlineInputBorder(
        //      borderSide: const BorderSide(color: AppColors.appBlueColor),
        //     borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.only(left: 10, right: 0,top: 15,bottom: 10),

        hintText: widget.hintText,

        suffixIcon:
            Icon(Icons.calendar_today_sharp, color: Colors.black, size: 20),
        //icon of text fieldtext of field
      ),
      readOnly: true,
      onTap: widget.ontap
    ));
  }
}
