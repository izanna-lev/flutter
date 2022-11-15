import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../services/settings_repo/setting_repo.dart';


class ContactAdminController extends GetxController {
  String contactAdminText = "";
  TextEditingController contactAdminTextController = TextEditingController();
  Future contactAdmin() async {
    var response = await ContactRepo.adminContact(message: contactAdminText);
    if (response != null) {
      return;
    }
  }
}
