import 'dart:convert';
import '../../models/settings/app_detail_model.dart';
import '../../models/settings/delete_account_model.dart';
import '../../models/settings/faq_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class ContactRepo {
  static Future adminContact({
    required String message,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.contactAdmin,
      body: jsonEncode({"message": message}),
    );
    if (responseBody != null) {
      return responseBody;
    } else {
      return null;
    }
  }

  static Future<FaqListModel?> fetchFaqs(int page) async {
    var responseBody = await API.apiHandler(
        url: APIRoutes.faqsList,
        showLoader: false,
        body: jsonEncode({"page": page}));
    print("============="
        "3");
    return FaqListModel.fromJson(responseBody!);
  }

  static Future<AppDetailModel?> getStaticData() async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.appDetailList,
      showLoader: false,
    );
    return AppDetailModel.fromJson(responseBody!);
  }

  static Future deleteAccountRepo({required String userRef}) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.userDelete,
      requestType: RequestType.Post,
      body: jsonEncode({"userRef": userRef}),
    );
    if (responseBody != null) {
      return DeleteAccountModel.fromJson(responseBody);
    } else {
      return;
    }
  }
}
