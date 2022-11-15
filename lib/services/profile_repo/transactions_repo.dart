import 'dart:convert';

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
