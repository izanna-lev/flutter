import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tralever_module/services/login_repo/login_repo.dart';

import '../../../../custem_class/utils/globle.dart';
import '../../../../models/login/user_model.dart';
import '../../base_screen/view/base_screen.dart';

class LoginController extends GetxController {
  final loginKey = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
    update();
  }

  CurrentUserModel? currentUserModel;

  Future userLogin() async {
    var response = await LoginRepo.login(
      email: emailTextController.text.trim(),
    );
    if (response != null) {
      emailTextController.clear();
      currentUserModel = CurrentUserModel.fromJson(response);
      userController.userModel = currentUserModel!.data;

      /// LocalStorage.saveUserDetails();
      Get.toNamed(BaseScreen.routeName);
    }
  }
}
