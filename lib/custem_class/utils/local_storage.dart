import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tralever_module/models/login/rownd_sign_in_model.dart';

import 'globle.dart';

class LocalStorage {
  static final prefs = GetStorage();

  static saveOnBoarding() {
    prefs.write("ONBOARDING", true);
  }

  static bool getOnBoarding() {
    return prefs.read("ONBOARDING") ?? false;
  }

  static setUserDetail(RowndSignInModel value) {
    print("set user detail---${value}");
    userController.rowndSignInModel = value;
    prefs.write("USER_DETAIL", userController.rowndSignInModel!.toJson());
    LocalStorage.setUserSignIn();
    // LocalStorage.saveUserToken();
  }

  static RowndSignInModel? getUserDetail() {
    Map<String, dynamic>? rowndSignInModel = prefs.read("USER_DETAIL");
    if (rowndSignInModel != null) {
      userController.rowndSignInModel =
          RowndSignInModel.fromJson(rowndSignInModel);
    }
    // return userController.rowndSignInModel == null ? false : true;
    return null;
  }

  static saveUserToken() {
    prefs.write("USER_TOKEN", userController.rowndSignInModel!.toJson());
    print("USER_TOKEN==>${userController.rowndSignInModel!.toJson()}");
  }

  static getUserToken() {
    prefs.read("USER_TOKEN") ?? "";
  }

  // static saveUserDetails() {
  //   log("saveUserDetails ${userController.rowndSignInDetailsModel!.toJson()}");
  //
  //   prefs.write(
  //       "SIGN_In_USER_DATA", userController.rowndSignInDetailsModel!.toJson());
  //   //LocalStorage.setUserLogin();
  // }
  //
  // static bool getUserDetails() {
  //   final rownd = RowndStateEventChannel();
  //
  //   Map<String, dynamic>? rowndSignInDetailsModel =
  //       prefs.read("SIGN_In_USER_DATA");
  //   log("getUserDetails $rowndSignInDetailsModel");
  //   if (rowndSignInDetailsModel != null) {
  //     userController.rowndSignInDetailsModel =
  //         RowndSignInDetailsModel.fromJson(rowndSignInDetailsModel);
  //   }
  //   return userController.rowndSignInDetailsModel == null ? false : true;
  // }

  static setUserSignIn() {
    prefs.write("IS_USER_SIGNIN", true);
  }

  static bool isUserSignIn() {
    return prefs.read("IS_USER_SIGNIN") ?? false;
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

  static setCardAdded(bool value) {
    prefs.write("CARD_ADD", value);
  }

  static bool isCardAdded() {
    return prefs.read("CARD_ADD") ?? false;
  }

  // saveUserDetails(UserModel data) {

  static clearData() {
    accessTokenBackup = null;
    prefs.remove("USER_DETAIL");
    prefs.remove("IS_USER_SIGNIN");
    print('CLEAR_USER_DATA${clearData}');
    FirebaseMessaging.instance.deleteToken();
  }
}

final sharedPreference = GetStorage();
