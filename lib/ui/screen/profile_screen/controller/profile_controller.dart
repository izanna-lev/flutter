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

  UserProfileModel? _userProfileModel;
  UserProfileModel? get userProfileModel => _userProfileModel;
  set userProfileModel(UserProfileModel? value) {
    _userProfileModel = value;
    userController.onUpdateUser();
  }

  Future editProfile({File? image}) async {
    EditProfileModel? response = await EditProfileRepo.editProfile(
      image: imagePickerController.image.isEmpty
          ? null
          : File(imagePickerController.image),
    );

    if (response != null) {
      imagePickerController.resetImage();
      userController.updateProfilePic(response.data);
      // userController.updateUser(response.data);
    }
  }

  Future<UserProfileDetailsModel?> userProfile() async {
    UserProfileModel? userProfileModel = await EditProfileRepo.userProfile();
    if (userProfileModel != null) {
      userProfileDetailsModel = userProfileModel.data;
      updateUserProfile(userProfileModel.data);
    }
    return userProfileDetailsModel;
  }

  updateUserProfile(UserProfileDetailsModel user) {
    userProfileModel?.data = user;
    userController.onUpdateUserProfile();
  }
}
