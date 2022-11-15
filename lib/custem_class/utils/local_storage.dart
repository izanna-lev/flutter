import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import '../../models/login/user_model.dart';
import 'globle.dart';

class LocalStorage {
  static final prefs = GetStorage();

  static saveOnBoarding() {
    prefs.write("ONBOARDING", true);
  }

  static bool getOnBoarding() {
    return prefs.read("ONBOARDING") ?? false;
  }

  static saveUserDetails() {
    log("saveUserDetails ${userController.userModel!.toJson()}");

    prefs.write("LOGIN_USER_DATA", userController.userModel!.toJson());
    LocalStorage.setUserLogin();
  }

  static bool getUserDetails() {
    Map<String, dynamic>? userModel = prefs.read("LOGIN_USER_DATA");
    log("getUserDetails $userModel");
    if (userModel != null) {
      userController.userModel = UserModel.fromJson(userModel);
    }
    return userController.userModel == null ? false : true;
  }

  static setUserLogin() {
    prefs.write("IS_USER_LOGIN", true);
  }

  static bool isUserLogin() {
    return prefs.read("IS_USER_LOGIN") ?? false;
  }

  static setFCMToken(String value) {
    prefs.write("USER_FCM_TOKEN", value);
  }

  static String getFCMToken() {
    return prefs.read("USER_FCM_TOKEN") ?? "";
  }

  static setFilter(int value) {
    prefs.write("filter", value);
  }

  static int getFilter() {
    return prefs.read("filter") ?? 0;
  }

  // saveUserDetails(UserModel data) {

  static clearData() {
    // prefs.remove("USER_FCM_TOKEN");
    prefs.remove("LOGIN_USER_DATA");
    prefs.remove("IS_USER_LOGIN");
  }
}

final sharedPreference = GetStorage();
