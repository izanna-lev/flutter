import 'dart:convert';

import 'package:tralever_module/custem_class/utils/globle.dart';

import '../../models/home/itinerary_add_screen_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class ItineraryAddRepo {
  static Future<ItineraryAddModel?> itineraryAddRepo({
    required String firstName,
    required String lastName,
    required String contactNumber,
    required String phoneCode,
    required String plannedDate,
    required String plannedTraveller,
    required String location,
    required int travellers,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.itineraryAdd,
      showLoader: false,
      requestType: RequestType.Post,
      header: {
        'Content-Type': 'application/json',
        "Authorization": userController.rowndSignInModel!.data.accessToken
      },
      body: jsonEncode({
        "firstName": firstName,
        "lastName": lastName,
        "contactNumber": contactNumber,
        "phoneCode": phoneCode,
        "plannedDate": plannedDate,
        "plannedTraveller": plannedTraveller,
        "location": location,
        "travellers": travellers,
      }),
    );
    if (responseBody != null) {
      return ItineraryAddModel.fromJson(responseBody);
    }
  }
}
