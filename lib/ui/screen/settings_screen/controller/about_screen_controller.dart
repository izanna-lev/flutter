import 'package:get/get.dart';

import '../../../../custem_class/utils/globle.dart';
import '../../../../models/settings/app_detail_model.dart';
import '../../../../models/settings/delete_account_model.dart';
import '../../../../services/settings_repo/setting_repo.dart';

class AboutScreenController extends GetxController {
  AppDetailDataModel? _appDetailDataModel;

  AppDetailDataModel? get appDetailDataModel => _appDetailDataModel;

  set appDetailDataModel(AppDetailDataModel? value) {
    _appDetailDataModel = value;
    update();
  }

  getStaticData() async {
    var request = await ContactRepo.getStaticData();
    appDetailDataModel = request!.data;
    update();
  }

  Future<void> deleteUser() async {
    DeleteAccountModel? deleteAccountModel =
        await ContactRepo.deleteAccountRepo(
            userRef: userController.rowndSignInDetailsModel!.traveller.id);

    if (deleteAccountModel != null) {
      return;
    }
  }

  @override
  void onInit() {
    getStaticData();
    super.onInit();
  }
}
