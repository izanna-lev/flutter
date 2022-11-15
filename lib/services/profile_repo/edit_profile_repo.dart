import 'dart:convert';
import 'dart:io';
import '../../models/profile/edit_profile_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class EditProfileRepo {
  static Future<EditProfileModel?> editProfile({
    File? picture,
  }) async {
    Map<String, dynamic>? responseBody = await API.multiPartAPIHandler(
        url: APIRoutes.editProfile,
        field: {"data": jsonEncode({})},
        fileImage: picture == null ? null : [picture],
        multiPartImageKeyName: "picture",
        encoding: Encoding.getByName("utf-8"));
    return responseBody == null
        ? null
        : EditProfileModel.fromJson(responseBody);
  }
}
