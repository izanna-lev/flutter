import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../screen/Home_screen/controller/itinerary_request_form_controller.dart';

class DemoDatePiker extends StatefulWidget {
  const DemoDatePiker({super.key});

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
      controller: itineraryRequestFormController.dateInput,
      decoration: const InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Color(0xffEDEDED),

        // enabledBorder: OutlineInputBorder(
        //      borderSide: BorderSide(color: AppColors.appBlueColor), //<-- SEE HERE
        //     ),
        // focusedBorder: OutlineInputBorder(
        //      borderSide: const BorderSide(color: AppColors.appBlueColor),
        //     borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        hintText: '12-may-2022',

        suffixIcon:
            Icon(Icons.calendar_today_sharp, color: Colors.black, size: 20),
        //icon of text fieldtext of field
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          log("$pickedDate"); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MMM-dd').format(pickedDate);
          log(formattedDate); //formatted date output using intl package =>  2021-03-16
          setState(() {
            itineraryRequestFormController.dateInput.text =
                formattedDate; //set output date to TextField value.
          });
        } else {}
      },
    ));
  }
}
