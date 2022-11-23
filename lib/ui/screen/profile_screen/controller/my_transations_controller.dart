import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tralever_module/models/profile/transactions_model.dart';
import 'package:tralever_module/services/profile_repo/transactions_repo.dart';

class MyTransactionsController extends GetxController {
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  final filterKey = GlobalKey<FormState>();

  List<TransactionListModel> _transactionListData = [];

  List<TransactionListModel> get transactionListData => _transactionListData;

  set transactionListData(List<TransactionListModel> value) {
    _transactionListData = value;
    update();
  }

  // Future<List<TransactionListModel>> transactionsData({
  //   int? transactionsType,
  //   String? fromDate,
  //   String? toDate,
  // }) async {
  //   TransactionModel? transactionModel =
  //       await TransactionsRepo.transactionsRepo(
  //     /// paid 1
  //     transactionsType: transactionsType,
  //     fromDate: fromDateController.text.trim(),
  //     toDate: toDateController.text.trim(),
  //
  //     /// CANCELLATION CHARGES 2
  //   );
  //   if (transactionModel != null) {
  //     transactionListData = transactionModel.data;
  //     return transactionListData;
  //   }
  //
  //   return [];
  // }

  transactionsData({
    int? transactionsType,
    String? fromDate,
    String? toDate,
  }) async {
    var request = await TransactionsRepo.transactionsRepo(
      /// paid 1
      /// CANCELLATION CHARGES 2
      transactionsType: transactionsType,
      fromDate: fromDateController.text.trim(),
      toDate: toDateController.text.trim(),
    );
    transactionListData = request!.data;
    update();
  }
}
