import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/models/profile/add_card_model.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/add_card_controller.dart';
import 'package:tralever_module/ui/screen/profile_screen/view/cars_added_successfully.dart';
import 'package:tralever_module/ui/shared/appbar.dart';
import 'package:tralever_module/ui/shared/material_button.dart';

import '../../../../custem_class/constant/app_functions.dart';
import '../../../shared/request_form_textfild.dart';

class AddCardScreen extends StatefulWidget {
  static const String routeName = "/AddCardScreen";

  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  AddCardController addCardController = Get.find<AddCardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Add Card"),
      body: GetBuilder(
        builder: (AddCardController addCardController) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SingleChildScrollView(
              child: Form(
                key: addCardController.addCardKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addCardTitle(text: "Card Holder Name"),
                    RequestFormTextfield(
                      formFieldType: RequestFormFieldType.cardholdername,
                      textCapitalization: TextCapitalization.characters,
                      textInputAction: TextInputAction.next,
                      controller: addCardController.cardHolderNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Your name";
                        }
                        return null;
                      },
                    ),
                    addCardTitle(text: "Card Number"),
                    RequestFormTextfield(
                      formFieldType: RequestFormFieldType.cardnumber,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      controller: addCardController.cardNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Your Card Number";
                        }
                        return null;
                      },
                    ),
                    addCardTitle(text: "Card Expiry"),
                    Row(
                      children: [
                        Expanded(
                            child: RequestFormTextfield(
                          formFieldType: RequestFormFieldType.month,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                          controller: addCardController.monthController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your Month";
                            }
                            return null;
                          },
                        )),
                        const SizedBox(width: 15),
                        Expanded(
                          child: RequestFormTextfield(
                            formFieldType: RequestFormFieldType.year,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.next,
                            controller: addCardController.yearController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Your Year";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    addCardTitle(text: "Cvv"),
                    RequestFormTextfield(
                      formFieldType: RequestFormFieldType.cvv,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.done,
                      controller: addCardController.cvvController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Your CVV Number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 170),
                    materialButton(
                      onTap: () async {
                        if (addCardController.addCardKey.currentState!
                            .validate()) {
                          disposeKeyboard();
                          addCardController.cadAddData();
                          // Map<String, dynamic>? responce =
                          //     await addCardController.cadAddData();
                          // if (responce != null) {
                          //   Get.toNamed(CardAddedSuccessfully.routeName);
                          // }

                          // Map<String, dynamic>? response =
                          //     await addCardController.cadAddData();
                          // if (response != null) {
                          //   Get.toNamed(CardAddedSuccessfully.routeName);
                          // }
                        }
                      },
                      text: "Add",
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  addCardTitle({required String text}) {
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
}
