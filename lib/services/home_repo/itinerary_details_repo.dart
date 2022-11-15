import 'dart:convert';

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
