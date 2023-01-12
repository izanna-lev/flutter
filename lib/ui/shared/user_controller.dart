import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_functions.dart';
import 'package:tralever_module/models/login/rownd_sign_in_model.dart';
import 'package:tralever_module/services/login_repo/login_repo.dart';

import '../../custem_class/utils/local_storage.dart';
import '../../models/login/user_model.dart';

class UserController extends GetxController {
  String? rowndAcessToken;
  // String? fcmToken;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  set userModel(UserModel? value) {
    _userModel = value;
    onUpdateUser();
  }

  RowndSignInModel? _rowndSignInModel;
  RowndSignInModel? get rowndSignInModel => _rowndSignInModel;
  set rowndSignInModel(RowndSignInModel? value) {
    _rowndSignInModel = value;
    onUpdateUser();
  }

  RowndSignInDetailsModel? _rowndSignInDetailsModel;
  RowndSignInDetailsModel? get rowndSignInDetailsModel =>
      _rowndSignInDetailsModel;
  set rowndSignInDetailsModel(RowndSignInDetailsModel? value) {
    _rowndSignInDetailsModel = value;
    update();
    // onUpdateUser();
  }

  Future<RowndSignInDetailsModel?> rowndSignIn(
      {required String token}) async {
    String newFcmToken = await FirebaseMessaging.instance.getToken() ?? "";
    RowndSignInModel? rowndSignInModel =
        await LoginRepo.rowndSignIn(token: token, fcmToken: newFcmToken);
    if (rowndSignInModel != null) {
      if (rowndSignInModel.code == 100) {
        LocalStorage.setUserDetail(rowndSignInModel);
        rowndSignInDetailsModel = rowndSignInModel.data;
        return rowndSignInDetailsModel;
      } else {
        print("rownd signIn response");
        flutterToast(rowndSignInModel.message);
      }
    }
    return null;
  }

  updateProfilePic(UserData userData) {
    userModel?.user = userData;
    print("-------------->${userData}");
    // LocalStorage.setUserDetail(rowndSignInModel);
    update();
  }

  bool _isGuest = false;
  bool get isGuest => _isGuest;
  set isGuest(bool value) {
    _isGuest = value;
    Future.delayed(Duration.zero, () {
      update();
    });
  }

  updateUser(UserData user) {
    userModel?.user = user;
    onUpdateUser();
  }

  updateRowndUser(RowndSignInDetailsModel rowndSignInDetailsModel) {
    rowndSignInDetailsModel.traveller;
    onUpdateUser();
  }

  onUpdateUser() {
    // LocalStorage.saveUserDetails();
    print("onUpdateUser");
    update();
  }

  onUpdateUserProfile() {
    LocalStorage.setUserDetail(rowndSignInModel!);
    update();
  }
}
