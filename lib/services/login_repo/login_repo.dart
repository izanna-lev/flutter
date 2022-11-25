import 'dart:convert';
import 'dart:io';

import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/models/login/rownd_sign_in_model.dart';

import '../api_handler.dart';
import '../api_routes.dart';

class LoginRepo {
  static Future login({
    required String email,
    String? fcmToken,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.login,
      body: jsonEncode(
        {
          "email": email,
          "device": Platform.isAndroid ? "android" : "ios",
        },
      ),
      header: {'Content-Type': 'application/json'},
    );
    if (responseBody != null) {
      return responseBody;
    } else {
      return null;
    }
  }

  static Future<RowndSignInModel?> rowndSignIn(
      {String? fcmToken, required String token}) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.rowndSignIn,
      showLoader: true,
      header: {'Authorization': token},
      body: jsonEncode({
        "fcmToken": userController.fcmToken,
        "device": Platform.isAndroid ? "android" : "ios",
      }),
    );
    if (responseBody != null) {
      return RowndSignInModel.fromJson(responseBody);
    }
  }
}
