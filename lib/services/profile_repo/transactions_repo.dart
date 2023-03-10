import 'dart:convert';

import '../../custem_class/utils/globle.dart';
import '../../models/profile/transactions_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class TransactionsRepo {
  static Future<TransactionModel?> transactionsRepo({
    int? transactionsType,
    String? fromDate,
    String? toDate,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.transactionList,
      showLoader: false,
      requestType: RequestType.Post,
      header: {
        'Content-Type': 'application/json',
        'Authorization': userController.rowndSignInModel!.data.accessToken
      },
      body: jsonEncode({
        "transactionsType": transactionsType,
        "fromDate": fromDate,
        "toDate": toDate,
      }),
    );
    if (responseBody != null) {
      return TransactionModel.fromJson(responseBody);
    }
  }
}
