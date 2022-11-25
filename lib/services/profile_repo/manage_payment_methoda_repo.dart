import 'dart:convert';
import 'dart:io';

import 'package:tralever_module/models/profile/manage_payment_methods_model.dart';

import '../../custem_class/utils/globle.dart';
import '../../models/login/successModel.dart';
import '../../models/profile/add_card_detaile_model.dart';
import '../../models/profile/add_card_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class CardRepo {
  // static Future<AddCardDetail?> cardAdd({
  //   required String stripeToken,
  // }) async {
  //   var responseBody = await API.multiPartAPIHandler(
  //       url: APIRoutes.cardAdd,
  //       field: {
  //         "data": jsonEncode({
  //           "stripeToken": stripeToken,
  //           "device": Platform.isAndroid ? "android" : "ios",
  //         })
  //       },
  //       header: {
  //         'Content-Type': 'multipart/form-data',
  //         'Authorization': userController.rowndSignInModel!.data.accessToken
  //       },
  //       token: userController.rowndSignInModel!.data.accessToken);
  //   if (responseBody != null) {
  //     return AddCardDetail.fromJson(responseBody);
  //   }
  // }

  // static Future<AddCardDetail?> cardAdd({
  //   required String stripeToken,
  // }) async {
  //   var responseBody = await API.multiPartAPIHandler(
  //       url: APIRoutes.cardAdd,
  //       field: {
  //         "stripeToken": stripeToken,
  //       },
  //       token: userController.rowndSignInModel!.data.accessToken);
  //   return responseBody == null ? null : AddCardDetail.fromJson(responseBody);
  // }

  static Future<AddCardDetail?> cardAdd({
    required String stripeToken,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.cardAdd,
      showLoader: false,
      requestType: RequestType.Post,
      header: {
        'Content-Type': 'application/json',
        'Authorization': userController.rowndSignInModel!.data.accessToken
      },
      body: jsonEncode({
        "stripeToken": stripeToken,
      }),
    );
    if (responseBody != null) {
      return AddCardDetail.fromJson(responseBody);
    }
  }

  // static Future<AddCard?> cardAddData({
  //   required String cardHolderName,
  //   required String cardNumber,
  //   required int month,
  //   required int year,
  //   required int cvv,
  // }) async {
  //   var responseBody = await API.multiPartAPIHandler(
  //       url: "https://api.stripe.com/v1/tokens",
  //       field: {
  //         "data": jsonEncode({
  //           "cardHolderName": cardHolderName,
  //           "card[number]": cardNumber,
  //           "card[exp_month]": month,
  //           "card[exp_year]": year,
  //           "card[cvc]": cvv,
  //         })
  //       },
  //       token:
  //           "Bearer sk_test_51KGKwWDA20erhUuBurmQ2UPfeMpJI86n5mdiymPj5CWxD2CoG9ETYP22x6cuDXenNuUT4P7xQ0NPwFmRzW3N6fgC00iCcZNsae");
  //
  //   if (responseBody != null) {
  //     return AddCard.fromJson(responseBody);
  //   }
  // }
  // static Future<AddCard?> cardAddData({
  //   required String cardHolderName,
  //   required String cardNumber,
  //   required String month,
  //   required String year,
  //   required String cvv,
  // }) async {
  //   var responseBody = await API.multiPartAPIHandler(
  //       url: "https://api.stripe.com/v1/tokens",
  //       field: {
  //         "cardHolderName": cardHolderName,
  //         "card[number]": cardNumber,
  //         "card[exp_month]": month,
  //         "card[exp_year]": year,
  //         "card[cvc]": cvv,
  //       },
  //       token:
  //           "Bearer sk_test_51JF4vAG0ZIlqut04vVg4LRJ7MyjmN7CqaQdywJjXZXbLY6CtlZuZ1TJujDXMwtC4AELBySa3yyMC5R2yJdo4k8r600imjRSehB");
  //   return responseBody == null ? null : AddCard.fromJson(responseBody);
  // }
  static Future<AddCard?> cardAddData({
    //required String stripeToken,
    required String cardHolderName,
    required String cardNumber,
    required String month,
    required String year,
    required String cvv,
  }) async {
    var responseBody = await API.cardAPICall(
      url: "https://api.stripe.com/v1/tokens",
      showLoader: false,
      requestType: RequestType.Post,
      header: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            "Bearer sk_test_51JF4vAG0ZIlqut04vVg4LRJ7MyjmN7CqaQdywJjXZXbLY6CtlZuZ1TJujDXMwtC4AELBySa3yyMC5R2yJdo4k8r600imjRSehB"
        // "Bearer sk_test_51KGKwWDA20erhUuBurmQ2UPfeMpJI86n5mdiymPj5CWxD2CoG9ETYP22x6cuDXenNuUT4P7xQ0NPwFmRzW3N6fgC00iCcZNsae"
      },
      body: {
        "card[name]": cardHolderName,
        "card[number]": cardNumber,
        "card[exp_month]": month,
        "card[exp_year]": year,
        "card[cvc]": cvv,
      },
    );
    if (responseBody != null) {
      return AddCard.fromJson(responseBody);
    }
  }

  // static Future<CardModel?> cardListRepo() async {
  //   var responseBody = await API.apiHandler(
  //     url: APIRoutes.cardList,
  //     showLoader: false,
  //     requestType: RequestType.Post,
  //     header: {
  //       'Content-Type': 'application/json',
  //       'Authorization': userController.rowndSignInModel!.data.accessToken
  //     },
  //     // body: jsonEncode(
  //     //
  //     // ),
  //   );
  //   if (responseBody != null) {
  //     return CardModel.fromJson(responseBody);
  //   }
  // }
  static Future<CardModel?> cardListRepo() async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.cardList,
      header: {
        'Content-Type': 'application/json',
        'Authorization': userController.rowndSignInModel!.data.accessToken
      },
      showLoader: false,
    );
    return CardModel.fromJson(responseBody!);
  }

  static Future removeCard({
    required String cardRef,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.cardRemove,
      requestType: RequestType.Post,
      header: {
        'Content-Type': 'application/json',
        'Authorization': userController.rowndSignInModel!.data.accessToken
      },
      body: jsonEncode({"cardRef": cardRef}),
    );
    if (responseBody != null) {
      return SuccessModel.fromJson(responseBody);
    }
  }
}
