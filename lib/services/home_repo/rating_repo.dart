import 'dart:convert';

import 'package:tralever_module/custem_class/utils/globle.dart';

import '../../models/home/tating_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class RatingDetailsRepo {
  static Future<RatingModel?> ratingDetailsRepo({
    required String itineraryRef,
    required double experience,
    required double specialist,
    required double value,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.ratingAdd,
      showLoader: false,
      requestType: RequestType.Post,
      header: {
        'Content-Type': 'application/json',
        "Authorization": userController.rowndSignInModel!.data.accessToken
      },
      body: jsonEncode({
        "itineraryRef": itineraryRef,
        "experience": experience,
        "specialist": specialist,
        "value": value,
      }),
    );
    if (responseBody != null) {
      return RatingModel.fromJson(responseBody);
    }
  }
}
