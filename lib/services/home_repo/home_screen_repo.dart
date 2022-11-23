import 'dart:convert';

import 'package:tralever_module/custem_class/utils/globle.dart';

import '../../models/home/travels_plans_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class HomeScreenRepo {
  static Future<TravelPlansModel?> homeScreenRepo({
    required int page,
    required int listType,
    // required int itineraryStatus,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.homeList,
      showLoader: false,
      requestType: RequestType.Post,
      header: {
        'Content-Type': 'application/json',
        "Authorization": userController.rowndSignInModel!.data.accessToken
      },
      body: jsonEncode({
        "page": page,
        "listType": listType,
        // "itineraryStatus": itineraryStatus,
      }),
    );
    if (responseBody != null) {
      return TravelPlansModel.fromJson(responseBody);
    }
  }
}
