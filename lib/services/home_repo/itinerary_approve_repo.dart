import 'dart:convert';

import '../../custem_class/utils/globle.dart';
import '../../models/home/itinerary_approve_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class ItineraryApproveRepo {
  static Future<ItineraryApproveModel?> itineraryApproveRepo({
    required String itineraryRef,
    required String cardRef,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.itineraryApprove,
      showLoader: false,
      requestType: RequestType.Post,
      header: {
        'Content-Type': 'application/json',
        'Authorization': userController.rowndSignInModel!.data.accessToken
      },
      body: jsonEncode({
        "itineraryRef": itineraryRef,
        "cardRef": cardRef,
      }),
    );
    if (responseBody != null) {
      // return ItineraryApproveModel.fromJson(responseBody);

    }
  }
}
