import 'dart:convert';

import 'package:tralever_module/models/profile/manage_payment_methods_model.dart';

import '../api_handler.dart';
import '../api_routes.dart';

class CardRepo {
  static Future<CardModel?> cardAdd({
    required String stripeToken,
    required String cardHolderName,
    required String cardNumber,
    required String month,
    required String year,
    required String cvv,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.cardAdd,
      showLoader: false,
      requestType: RequestType.Post,
      header: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "stripeToken": stripeToken,
        "cardHolderName": cardHolderName,
        "cardNumber": cardNumber,
        "month": month,
        "year": year,
        "cvv": cvv,
      }),
    );
    if (responseBody != null) {
      return CardModel.fromJson(responseBody);
    }
  }
}
