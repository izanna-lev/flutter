import 'dart:convert';
import 'dart:io';

import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/models/profile/user_profile_model.dart';

import '../../models/profile/edit_profile_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class EditProfileRepo {
  static Future<EditProfileModel?> editProfile({File? image}) async {
    Map<String, dynamic>? responseBody = await API.multiPartAPIHandler(
        token: userController.rowndSignInModel!.data.accessToken,
        url: APIRoutes.editProfile,
        field: {},
        fileImage: image,
        multiPartImageKeyName: "image",
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
        });
    if (responseBody != null) {
      return UserProfileModel.fromJson(responseBody);
    }
    return null;
  }
}
