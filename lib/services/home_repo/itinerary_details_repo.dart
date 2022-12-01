import 'dart:convert';

import 'package:tralever_module/custem_class/utils/globle.dart';

import '../../models/home/itinerary_details_model.dart';
import '../../models/login/successModel.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class ItineraryDetailsRepo {
  static Future<ItineraryDetailsModel?> itineraryDetailsRepo({
    required String itineraryRef,
    // required timezone,
    String? date,
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
        "timezone": GetLocalTimezone.currentTimeZoneName,
        "date": date,
      }),
    );
    if (responseBody != null) {
      return ItineraryDetailsModel.fromJson(responseBody);
    }
  }

  static Future itineraryCancellationRequest({
    required String itineraryRef,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.itineraryCancellationRequest,
      requestType: RequestType.Post,
      header: {
        'Content-Type': 'application/json',
        'Authorization': userController.rowndSignInModel!.data.accessToken
      },
      body: jsonEncode({
        "itineraryRef": itineraryRef,
      }),
    );
    if (responseBody != null) {
      return SuccessModel.fromJson(responseBody);
    }
  }
}
