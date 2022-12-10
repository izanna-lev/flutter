import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/my_transations_controller.dart';

class ToDemoDatePiker extends StatefulWidget {
  const ToDemoDatePiker({super.key});

  @override
  State<StatefulWidget> createState() {
    return ToDatePickerState();
  }
}

class ToDatePickerState extends State<ToDemoDatePiker> {
  //TextEditingController dateInput = TextEditingController();
  MyTransactionsController myTransactionsController =
      Get.find<MyTransactionsController>();

  @override
  void initState() {
    myTransactionsController.toDateController.text =
        ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextFormField(
      controller: myTransactionsController.toDateController,
      style: TextStyle(fontSize: 10),
      decoration: const InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,

        // enabledBorder: OutlineInputBorder(
        //      borderSide: BorderSide(color: AppColors.appBlueColor), //<-- SEE HERE
        //     ),
        // focusedBorder: OutlineInputBorder(
        //      borderSide: const BorderSide(color: AppColors.appBlueColor),
        //     borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        hintText: 'DD-MM-YYYY',
        hintStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),

        // suffixIcon:
        //     Icon(Icons.calendar_today_sharp, color: Colors.black, size: 20),
        //icon of text fieldtext of field
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          log("$pickedDate"); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          log(formattedDate); //formatted date output using intl package =>  2021-03-16
          setState(() {
            myTransactionsController.toDateController.text =
                formattedDate; //set output date to TextField value.
          });
        } else {}
      },
    ));
  }
}
