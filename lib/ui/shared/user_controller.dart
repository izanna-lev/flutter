import 'package:get/get.dart';
import '../../custem_class/utils/local_storage.dart';
import '../../models/login/user_model.dart';

class UserController extends GetxController {
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  set userModel(UserModel? value) {
    _userModel = value;
    onUpdateUser();
  }

  updateProfilePic(dynamic url) {
    userModel?.user.image = url;
    print("-------------->${url}");
    LocalStorage.saveUserDetails();
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

  onUpdateUser() {
    LocalStorage.saveUserDetails();
    print("onUpdateUser");
    update();
  }
}
