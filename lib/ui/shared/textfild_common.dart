import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custem_class/constant/app_functions.dart';
import '../../custem_class/constant/app_settings.dart';

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

enum FormFieldType {
  email,
}

class FormInputTextfield extends StatelessWidget {
  final FormFieldType formFieldType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final String password;
  final String suffixText;
  final bool isSuffixIcon;
  final bool isPreffixIcon;
  final bool autoFocus;
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

  FormInputTextfield({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (onChanged != null) onChanged!(value);
      },
      // validator: (value) {
      //   return getValidation(value!);
      // },
      onTap: () {
        if (onTap != null) {
          disposeKeyboard();
          onTap!();
        }
      },
      onFieldSubmitted: (value) {
        if (value.isNotEmpty && onFieldSubmitted != null) {
          onFieldSubmitted!(value);
        }
      },
      keyboardType: getTextInputType(),
      maxLines: getMaxLines,
      readOnly: false,
      textInputAction: textInputAction,
      controller: controller,
      obscureText: false,
      autofocus: autoFocus,
      validator: validator,
      focusNode: focusNode,
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
        hintText: getHintText(),
        suffixText: suffixText,
        // filled: true,
        // fillColor: AppColors.texFildInputColor,

        suffixStyle: const TextStyle(fontSize: 14, color: Colors.black),
        hintStyle: const TextStyle(
          fontFamily: kAppFont,
          fontSize: 16,
        ),
        errorStyle: const TextStyle(color: Colors.red),
        errorMaxLines: 2,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        //contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          // borderSide: const BorderSide(color: AppColors.appColor),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //    borderSide: const BorderSide(color: AppColors.appColor),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(15),
        //   borderSide: const BorderSide(color: AppColors.appBlueColor),
        // ),
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        suffixIcon: getSuffixIcon(),
        prefixIcon: getPrefixIcon(),
      ),
      textCapitalization: textCapitalization!,

      //textCapitalization: TextCapitalization.words,
    );
  }

  String? getLabel() {
    return null;
  }

  String getHintText() {
    switch (formFieldType) {
      case FormFieldType.email:
        return "example@mail.com".tr;

      default:
        break;
    }
    return "";
  }

  Widget? getPrefixIcon() {
    switch (formFieldType) {
      case FormFieldType.email:
        return Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "@",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
          ],
        );
      default:
        break;
    }
    return null;
  }

  Widget? getSuffixIcon() {
    if (isSuffixIcon == false) return null;
    switch (formFieldType) {

      // case FormFieldType.DIVE_SITE_OR_LOCATION:
      // case FormFieldType.DIVE_BUDDIES:
      //   // case FormFieldType.DIVE_OPERATOR:
      //   // return controller.searchKeyword.length > 0
      //   //     ? GestureDetector(onTap: () {
      //   //     searchController.clear();
      //   //     controller.onSearch("");
      //   //     },
      //   //     child: Icon(
      //   //       Icons.close,
      //   //       color: AppColor.blue,
      //   //     ),
      //   //    ) : null,
      //   return GestureDetector(
      //     onTap: onClear,
      //     child: const Icon(
      //       Icons.close,
      //       color: Colors.black,
      //     ),
      //   );
      //   break;

      default:
        break;
    }
    return null;
  }

  int get getMaxLines {
    switch (formFieldType) {
      default:
        return 1;
    }
  }

  TextInputType getTextInputType() {
    switch (formFieldType) {
      case FormFieldType.email:
        return TextInputType.emailAddress;
      default:
        break;
    }
    return TextInputType.text;
  }

  String? getValidation(String value) {
    if (value.isEmpty) {
      switch (formFieldType) {
        case FormFieldType.email:
          return 'Enter Your Email'.tr;

        default:
          break;
      }
    } else {
      if (formFieldType == FormFieldType.email &&
          !emailValidatorRegExp.hasMatch(value)) {
        return 'emailInvalidError'.tr;
      }
    }
    return null;
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
