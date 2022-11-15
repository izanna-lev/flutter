import 'dart:convert';

import '../../models/home/tating_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class RatingDetailsRepo {
  static Future<RatingModel?> ratingDetailsRepo({
    required String itineraryRef,
    required int experience,
    required int specialist,
    required int value,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.ratingAdd,
      showLoader: false,
      requestType: RequestType.Post,
      header: {'Content-Type': 'application/json'},
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
