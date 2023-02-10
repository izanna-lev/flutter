import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_request_form_controller.dart';
import 'package:tralever_module/ui/shared/appbar.dart';
import 'package:tralever_module/ui/shared/dilog_box.dart';
import 'package:tralever_module/ui/shared/material_button.dart';
import '../../../shared/date_picker.dart';
import '../../../shared/request_form_textfild.dart';

class ItineraryFromScreen extends StatefulWidget {
  static const String routeName = "/ItineraryFromScreen";

  const ItineraryFromScreen({Key? key}) : super(key: key);

  @override
  State<ItineraryFromScreen> createState() => _ItineraryFromScreenState();
}

class _ItineraryFromScreenState extends State<ItineraryFromScreen> {
  ItineraryRequestFormController itineraryRequestController =
      Get.find<ItineraryRequestFormController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Itinerary Request Form"),
      body: SingleChildScrollView(
        child: GetBuilder(
          builder: (ItineraryRequestFormController itineraryRequestController) {
            return Form(
              key: itineraryRequestController.itineraryRequestKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFieldTitle(text: "First Name"),
                        RequestFormTextfield(
                          formFieldType: RequestFormFieldType.firstname,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          isHideHint: true,
                          controller:
                              itineraryRequestController.firstnameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your First Name";
                            }
                            return null;
                          },
                        ),
                        textFieldTitle(text: "Last Name"),
                        RequestFormTextfield(
                          formFieldType: RequestFormFieldType.lastname,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          isHideHint: true,
                          controller:
                              itineraryRequestController.lastnameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Last Name";
                            }
                            return null;
                          },
                        ),
                        textFieldTitle(text: "Contact Number"),

                        /// showCountryPicker(
                        ///   context: context,
                        ///   showPhoneCode:
                        ///       true, // optional. Shows phone code before the country name.
                        ///   onSelect: (Country country) {
                        ///     print('Select country: ${country.displayName}');
                        ///   },
                        /// ),
                        RequestFormTextfield(
                          formFieldType: RequestFormFieldType.contactNumber,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                          isHideHint: true,
                          controller: itineraryRequestController
                              .contactNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your Contact Number";
                            }
                            return null;
                          },
                        ),
                        textFieldTitle(text: "Where would you like to go?"),
                        RequestFormTextfield(
                          formFieldType:
                              RequestFormFieldType.wherewouldyouliketogo,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          isHideHint: true,
                          controller:
                              itineraryRequestController.locationController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your Detail";
                            }
                            return null;
                          },
                        ),
                        textFieldTitle(text: "How many are traveling?"),
                        RequestFormTextfield(
                          formFieldType:
                              RequestFormFieldType.howmanyaretraveling,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                          isHideHint: true,
                          controller: itineraryRequestController
                              .howManyAreTravelingController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your Detail";
                            }
                            return null;
                          },
                        ),
                        textFieldTitle(
                            text: "When are you planning to travel?"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  dateText(text: "Start Date"),
                                   SizedBox(height: 5,),
                                   SizedBox(
                                    height: 50,
                                    child: DemoDatePiker(
                                      ontap: () async {
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
                                            itineraryRequestController.dateInput.text =
                                                formattedDate; //set output date to TextField value.
                                          });
                                        } else {}
                                      },
                                      controller: itineraryRequestController.dateInput,
                                      hintText: '',//'12-may-2022',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 dateText(text: "End Date"),
                                  SizedBox(height: 5,),
                                   SizedBox(
                                    height: 50,
                                    child: DemoDatePiker(
                                      controller: itineraryRequestController.endDateInput,
                                      hintText: '',//'24-may-2022',
                                      ontap: () async {
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
                                        itineraryRequestController.endDateInput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {}
                                    },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        textFieldTitle(
                            text: "How much you have already planned?"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: AppColors.appBlueColor,
                                value: itineraryRequestController.value1,
                                groupValue:
                                    itineraryRequestController.radioGroup,
                                onChanged: (int? value) {
                                  itineraryRequestController.radioGroup =
                                      value!.toInt();
                                }),
                            radioText(text: "I haven't even started.")
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          child: Divider(thickness: 1.5),
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: AppColors.appBlueColor,
                                value: itineraryRequestController.value2,
                                groupValue:
                                    itineraryRequestController.radioGroup,
                                onChanged: (int? value) {
                                  itineraryRequestController.radioGroup =
                                      value!.toInt();
                                }),
                            radioText(
                                text:
                                    "I have a few things planned but still have a lot to go."),
                          ],
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Divider(thickness: 1.5),
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: AppColors.appBlueColor,
                                value: itineraryRequestController.value3,
                                groupValue:
                                    itineraryRequestController.radioGroup,
                                onChanged: (int? value) {
                                  itineraryRequestController.radioGroup =
                                      value!.toInt();
                                }),
                            radioText(
                              text:
                                  "The important stuff is booked but I need to plan the itinerary.",
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 20),
                          child: Divider(thickness: 1.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: materialButton(
                      onTap: () async {
                        if (itineraryRequestController
                            .itineraryRequestKey.currentState!
                            .validate()) {
                          var response = await itineraryRequestController
                              .itineraryAddData();

                          if (response != null) {
                            dialogBox();
                          }
                        }
                      },
                      text: "Submit Request",
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  dialogBox() {
    return showCustomDialog(
      context: context,
      title: "Itinerary Request Submitted Successfully",
      content: "Your travel concierge will reach out to you shortly.",
      contentSize: 1,
      onTap: () {
        Get.back();
        Get.back();
      },
      color: AppColors.appBlueColor,
      okText: "Go to Home",
    );
  }

  textFieldTitle({required String text}) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  radioText({required String text}) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  dateText({required String text}) {
    return Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        ),
    );
  }
}
