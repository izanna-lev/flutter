import 'dart:convert';

import 'package:tralever_module/custem_class/utils/globle.dart';

import '../../models/home/itinerary_details_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class ItineraryDetailsRepo {
  static Future<ItineraryDetailsModel?> itineraryDetailsRepo({
    required String itineraryRef,
    required int timezone,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.homeDetails,
      showLoader: false,
      requestType: RequestType.Post,
      header: {
        'Content-Type': 'application/json',
        "Authorization": userController.rowndSignInModel!.data.accessToken
      },
      body: jsonEncode({
        "itineraryRef": itineraryRef,
        "timezone": timezone,
      }),
    );
    if (responseBody != null) {
      return ItineraryDetailsModel.fromJson(responseBody);
    }
  }
}
