import 'dart:convert';
import 'dart:io';

import 'package:rownd_flutter_plugin/rownd.dart';
import 'package:tralever_module/custem_class/utils/local_storage.dart';
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

  static final _rownd = RowndPlugin();

  static Future<RowndSignInModel?> rowndSignIn(
      {String? fcmToken, required String token}) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.rowndSignIn,
      requestType: RequestType.Post,
      showLoader: true,
      header: {
        'Authorization': "Bearer $token",
        "Content-Type": "application/json"
      },
      body: jsonEncode(
        {
          "fcmToken": fcmToken,
          "device": Platform.isAndroid ? "android" : "ios",
        },
      ),
    );
    if (responseBody != null) {
      return RowndSignInModel.fromJson(responseBody);
    } else {
      print("rownd signIn apiHandler response");
      if (_rownd.state().state.auth?.isAuthenticated ?? false) {
        print("rownd signOut");
        _rownd.signOut();
        LocalStorage.clearData();
      }
    }
    return null;
  }
}
