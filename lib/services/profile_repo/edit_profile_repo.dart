import 'dart:convert';
import 'dart:io';

import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/models/profile/user_profile_model.dart';

import '../../models/profile/edit_profile_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class ProfileRepo {
  static Future<EditProfileModel?> editProfile(
      {File? picture, String? token}) async {
    Map<String, dynamic>? responseBody = await API.multiPartAPIHandler(
        token: token.toString(),
        url: APIRoutes.editProfile,
        field: {"data": jsonEncode({})},
        fileImage: picture == null ? null : [picture],
        multiPartImageKeyName: "picture",
        encoding: Encoding.getByName("utf-8"));
    return responseBody == null
        ? null
        : EditProfileModel.fromJson(responseBody);
  }

  static Future<UserProfileModel?> userProfile() async {
    var responseBody = await API.apiHandler(
        url: APIRoutes.userProfile,
        showLoader: false,
        requestType: RequestType.Post,
        header: {
          'Authorization': userController.rowndSignInModel!.data.accessToken
          // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoiNjM2ZjIyOTlkMjZjZWNhNzIzY2ZkNDYzIiwiZW1haWwiOiJ0ZXN0eWVhcjUxQGdtYWlsLmNvbSIsInRva2VuTGlmZSI6IjdkIiwicm9sZSI6InVzZXIifSwiaWF0IjoxNjY4NDI1OTEyLCJleHAiOjE2NjkwMzA3MTJ9.F9AAzuoEjltivWXwKWlrgBi0KyQoMHPdeZgX3R2y1cU'
        });
    if (responseBody != null) {
      return UserProfileModel.fromJson(responseBody);
    }
    return null;
  }
}
