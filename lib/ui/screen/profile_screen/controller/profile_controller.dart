import 'dart:io';

import 'package:get/get.dart';
import 'package:tralever_module/models/profile/edit_profile_model.dart';
import 'package:tralever_module/models/profile/user_profile_model.dart';

import '../../../../custem_class/utils/globle.dart';
import '../../../../services/profile_repo/edit_profile_repo.dart';
import '../../../shared/image_picker_controller.dart';

class ProfileController extends GetxController {
  File? image;
  ImagePickerController imagePickerController =
      Get.find<ImagePickerController>();

  EditProfileModel? _editProfileModel;
  EditProfileModel? get editProfileModel => _editProfileModel;
  set editProfileModel(EditProfileModel? value) {
    _editProfileModel = value;
    update();
  }

  UserProfileDetailsModel? _userProfileDetailsModel;
  UserProfileDetailsModel? get userProfileDetailsModel =>
      _userProfileDetailsModel;
  set userProfileDetailsModel(UserProfileDetailsModel? value) {
    _userProfileDetailsModel = value;
    update();
  }

  Future editProfile() async {
    EditProfileModel? response = await ProfileRepo.editProfile(
      picture: imagePickerController.image.isEmpty
          ? null
          : File(imagePickerController.image),
    );

    if (response != null) {
      imagePickerController.resetImage();
      userController.updateUser(response.data);
    }
  }

  Future<UserProfileDetailsModel?> userProfile() async {
    UserProfileModel? userProfileModel = await ProfileRepo.userProfile();
    if (userProfileModel != null) {
      userProfileDetailsModel = userProfileModel.data;
    }
    return null;
  }
}
