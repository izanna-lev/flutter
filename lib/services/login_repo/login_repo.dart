import 'dart:convert';
import 'dart:io';

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
    var responseBody = await API.multiPartAPIHandler(
        url: APIRoutes.rowndSignIn,
        field: {
          "data": jsonEncode({
            "fcmToken": "",
            "device": Platform.isAndroid ? "android" : "ios",
          })
        },
        token: token.toString());
    if (responseBody != null) {
      return RowndSignInModel.fromJson(responseBody);
    }
  }
}
