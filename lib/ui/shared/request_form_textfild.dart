import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_request_form_controller.dart';

import '../../custem_class/constant/app_functions.dart';
import '../../custem_class/constant/app_settings.dart';

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

enum RequestFormFieldType {
  firstname,
  lastname,
  contactNumber,
  wherewouldyouliketogo,
  howmanyaretraveling,
  whenareyouplanningtotravel,
  cardholdername,
  cardnumber,
  cvv,
  month,
  year,
  typehere
}

class RequestFormTextfield extends StatefulWidget {
  final RequestFormFieldType formFieldType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final String password;
  final String suffixText;
  final bool isSuffixIcon;
  final bool isPreffixIcon;
  final bool autoFocus;
  final bool isHideHint;
  FocusNode? focusNode;
  ValueSetter? onChanged;
  GestureTapCallback? onTap;
  VoidCallback? onClear;
  ValueSetter? onFieldSubmitted;
  TextCapitalization? textCapitalization;

  final String? Function(String?)? validator;

  UnderlineInputBorder? border = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black));
  UnderlineInputBorder? errorBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black));
  UnderlineInputBorder? focusBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Colors.black));

  RequestFormTextfield({
    Key? key,
    required this.formFieldType,
    required this.textInputAction,
    this.password = "",
    this.suffixText = "",
    this.isSuffixIcon = false,
    this.isPreffixIcon = false,
    required this.controller,
    this.autoFocus = false,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onClear,
    this.onFieldSubmitted,
    this.border,
    this.errorBorder,
    this.focusBorder,
    this.textCapitalization,
    this.isHideHint = false,
  }) : super(key: key);

  @override
  State<RequestFormTextfield> createState() => _RequestFormTextfieldState();
}

class _RequestFormTextfieldState extends State<RequestFormTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!(value);
      },
      // validator: (value) {
      //   return getValidation(value!);
      // },
      onTap: () {
        if (widget.onTap != null) {
          disposeKeyboard();
          widget.onTap!();
        }
      },
      onFieldSubmitted: (value) {
        if (value.isNotEmpty && widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(value);
        }
      },
      keyboardType: getTextInputType(),
      maxLines: getMaxLines,
      readOnly: false,
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      obscureText: false,
      autofocus: widget.autoFocus,
      validator: widget.validator,
      focusNode: widget.focusNode,
      cursorColor: Colors.black,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontFamily: kAppFont,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        // focusedBorder: const UnderlineInputBorder(
        //     borderSide: BorderSide(color: Colors.grey)),
        // contentPadding: const EdgeInsets.only(
        //   top: 10,
        // ),

        labelText: getLabel(),
        hintText: widget.isHideHint ? "" : getHintText(),
        suffixText: widget.suffixText,
        filled: true,
        fillColor: const Color(0xffEDEDED),

        suffixStyle: const TextStyle(fontSize: 14, color: Colors.black),
        hintStyle: const TextStyle(
          fontFamily: kAppFont,
          fontSize: 16,
        ),
        errorStyle: const TextStyle(color: Colors.red),
        errorMaxLines: 2,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        border: const OutlineInputBorder(
            // borderRadius: BorderRadius.circular(10),
            //borderSide: const BorderSide(color: Color(0xffEDEDED)),
            ),
        enabledBorder: const OutlineInputBorder(
          //borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(0xffEDEDED)),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   borderSide: const BorderSide(color: AppColors.appBlueColor),
        // ),
        errorBorder: widget.errorBorder,
        focusedErrorBorder: widget.errorBorder,
        suffixIcon: getSuffixIcon(),
        prefixIcon: getPrefixIcon(),
      ),
      textCapitalization: widget.textCapitalization!,

      //textCapitalization: TextCapitalization.words,
    );
  }

  String? getLabel() {
    return null;
  }

  String getHintText() {
    switch (widget.formFieldType) {
      case RequestFormFieldType.firstname:
        return "Steve".tr;
      case RequestFormFieldType.lastname:
        return "Walter".tr;
      case RequestFormFieldType.contactNumber:
        return "987456310".tr;
      case RequestFormFieldType.wherewouldyouliketogo:
        return "Philippines".tr;
      case RequestFormFieldType.howmanyaretraveling:
        return "5".tr;
      case RequestFormFieldType.whenareyouplanningtotravel:
        return "12-may-2022".tr;
      case RequestFormFieldType.cardholdername:
        return "Steve Wlater".tr;
      case RequestFormFieldType.cardnumber:
        return "XXXX-XXXX-XXXX-1254".tr;
      case RequestFormFieldType.cvv:
        return "XXX".tr;
      case RequestFormFieldType.month:
        return "MM".tr;
      case RequestFormFieldType.year:
        return "YY".tr;
      case RequestFormFieldType.typehere:
        return "Type Here";

      default:
        break;
    }
    return "";
  }

  // final countryPicker = const FlCountryCodePicker();
  //
  // CountryCode? countryCode;
  ItineraryRequestFormController itineraryRequestFormController =
      Get.find<ItineraryRequestFormController>();
  Widget? getPrefixIcon() {
    switch (widget.formFieldType) {
      case RequestFormFieldType.contactNumber:
        return GestureDetector(
          onTap: () async {
            final code = await itineraryRequestFormController.countryPicker
                .showPicker(context: context);
            setState(() {
              itineraryRequestFormController.countryCode = code;
            });
          },
          child: SizedBox(
            width: 75,
            child: Padding(
              padding: const EdgeInsets.only(top: 3, left: 10),
              child: Row(
                children: [
                  Text(itineraryRequestFormController.countryCode?.dialCode ??
                      "+1"),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        );

      // case FormFieldType.email:
      //   return Column(
      //     children: const [
      //       Padding(
      //         padding: EdgeInsets.only(top: 8),
      //         child: Text(
      //           "@",
      //           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      //         ),
      //       ),
      //     ],
      //   );
      default:
        break;
    }
    return null;
  }

  Widget? getSuffixIcon() {
    if (widget.isSuffixIcon == false) {
      switch (widget.formFieldType) {
        case RequestFormFieldType.month:
          return const Icon(Icons.calendar_today_sharp, color: Colors.black);
        case RequestFormFieldType.year:
          return const Icon(Icons.calendar_today_sharp, color: Colors.black);
      }
    }
    return null;
  }

  int get getMaxLines {
    switch (widget.formFieldType) {
      default:
        return 1;
    }
  }

  TextInputType getTextInputType() {
    switch (widget.formFieldType) {
      case RequestFormFieldType.howmanyaretraveling:
        return TextInputType.number;
      case RequestFormFieldType.contactNumber:
        return TextInputType.number;
      case RequestFormFieldType.cardnumber:
        return TextInputType.number;
      case RequestFormFieldType.cvv:
        return TextInputType.number;
      case RequestFormFieldType.month:
        return TextInputType.number;
      case RequestFormFieldType.year:
        return TextInputType.datetime;

      default:
        break;
    }
    return TextInputType.text;
  }

  String? getValidation(String value) {
    if (value.isEmpty) {
      switch (widget.formFieldType) {
        case RequestFormFieldType.firstname:
          return "Enter Your First Name";
        case RequestFormFieldType.lastname:
          return "Enter Your Last Name";
        case RequestFormFieldType.contactNumber:
          return "Enter Your Contact Number";
        case RequestFormFieldType.wherewouldyouliketogo:
          return "Enter Your Detail";
        case RequestFormFieldType.howmanyaretraveling:
          return "Enter Your Detail";
        case RequestFormFieldType.whenareyouplanningtotravel:
          return "Enter Date";
      }
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return "Please enter email";
    }
    if (!regex.hasMatch(
      value.toString(),
    )) {
      return 'Please enter valid email';
    } else {
      return null;
    }
  }
}
