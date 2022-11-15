import 'dart:convert';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tralever_module/services/home_repo/itinerary_add_repo.dart';

import '../../../../models/home/itinerary_add_screen_model.dart';

class ItineraryRequestFormController extends GetxController {
  final itineraryRequestKey = GlobalKey<FormState>();
  final countryPicker = const FlCountryCodePicker();

  CountryCode? countryCode;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController howManyAreTravelingController = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  // TextEditingController dateController = TextEditingController();
  int _value1 = 1;

  int get value1 => _value1;

  set value1(int value) {
    _value1 = value;
    update();
  }

  int _value2 = 2;

  int get value2 => _value2;

  set value2(int value) {
    _value2 = value;
    update();
  }

  int _value3 = 3;

  int get value3 => _value3;

  set value3(int value) {
    _value3 = value;
    update();
  }

  int _radioGroup = 1;

  int get radioGroup => _radioGroup;

  set radioGroup(int value) {
    _radioGroup = value;
    update();
  }

  // String _value1 = "I haven't even started.";
  //
  // String get value1 => _value1;
  //
  // set value1(String value) {
  //   _value1 = value;
  //   update();
  // }
  //
  // String _value2 = "I have a few things";
  //
  // String get value2 => _value2;
  //
  // set value2(String value) {
  //   _value2 = value;
  //   update();
  // }
  //
  // String _value3 = "The important stuff";
  //
  // String get value3 => _value3;
  //
  // set value3(String value) {
  //   _value3 = value;
  //   update();
  // }
  //
  // String _radioGroup = "I haven't even started.";
  //
  // String get radioGroup => _radioGroup;
  //
  // set radioGroup(String value) {
  //   _radioGroup = value;
  //   update();
  // }
  //
  //

  List<ItineraryAddListModel> _itineraryAdd = [];

  List<ItineraryAddListModel> get itineraryAdd => _itineraryAdd;

  set itineraryAdd(List<ItineraryAddListModel> value) {
    _itineraryAdd = value;
    update();
  }

  Future itineraryAddData() async {
    await ItineraryAddRepo.itineraryAddRepo(
      firstName: firstnameController.text.trim(),
      lastName: lastnameController.text.trim(),
      contactNumber: contactNumberController.text.trim(),
      phoneCode: countryCode?.dialCode ?? "+63",
      plannedDate: dateInput.text,
      location: locationController.text.trim(),
      travellers: int.parse(howManyAreTravelingController.text.trim()),
      plannedTraveller: _radioGroup,
    );
    return ItineraryAddModel;
  }
}
