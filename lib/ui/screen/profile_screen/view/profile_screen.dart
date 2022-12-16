import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/profile_controller.dart';
import 'package:tralever_module/ui/screen/profile_screen/view/manage_payment_screen.dart';
import 'package:tralever_module/ui/screen/profile_screen/view/my_transactions_screen.dart';

import '../../../../custem_class/constant/app_colors.dart';
import '../../../../custem_class/constant/app_images.dart';
import '../../../../custem_class/utils/globle.dart';
import '../../../shared/image_picker_controller.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "/ProfileScreen";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.find<ProfileController>();

  late String currImageUrl;
  @override
  void initState() {
    profileController.userProfile();
    profileController.update();
    super.initState();
    currImageUrl = AppImages.loginBackgroundImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder(
        builder: (ImagePickerController imagePickerController) {
          if (currImageUrl != imagePickerController.image &&
              imagePickerController.image.isNotEmpty) {
            currImageUrl = imagePickerController.image;

            /// call api
            profileController.editProfile(
                image: File(imagePickerController.image));
            print("CALL API");
          }
          return GetBuilder(
            builder: (ProfileController profileController) {
              return Container(
                  decoration: BoxDecoration(
                      image: imagePickerController.image.isEmpty
                          ? profileController.userProfileDetailsModel!.image ==
                                  ""
                              ? DecorationImage(
                                  image: AssetImage(currImageUrl),
                                  fit: BoxFit.cover)
                              : DecorationImage(
                                  image: NetworkImage(profileController
                                          .userProfileDetailsModel!
                                          .image
                                          .isEmpty
                                      ? ""
                                      : imageUrl +
                                          profileController
                                              .userProfileDetailsModel!.image),
                                  fit: BoxFit.cover,
                                )
                          : DecorationImage(
                              image:
                                  FileImage(File(imagePickerController.image)),
                              fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    appImagePicker.openBottomSheet();
                                  },
                                  child: Image.asset(
                                    AppIcons.editIcon,
                                    width: 50,
                                  ),
                                ),
                                const SizedBox(width: 20),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                color: Colors.white,
                              ),
                              width: double.infinity,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: kDefaultPadding),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 20),
                                      Text(
                                        profileController
                                                .userProfileDetailsModel!
                                                .name
                                                .isEmpty
                                            ? ""
                                            : profileController
                                                .userProfileDetailsModel!.name,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        profileController
                                                .userProfileDetailsModel!
                                                .email
                                                .isEmpty
                                            ? ""
                                            : profileController
                                                .userProfileDetailsModel!.email,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 25),
                                      profileSell(
                                        img: AppIcons.manageCardIcon,
                                        text: "Manage Payment Methods",
                                        onTap: () {
                                          Get.toNamed(
                                              ManagePaymentScreen.routeName);
                                        },
                                        icon: Icons.navigate_next_sharp,
                                      ),
                                      const SizedBox(height: 10),
                                      profileSell(
                                        img: AppIcons.transactionsIcon,
                                        text: "My Transactions",
                                        onTap: () {
                                          Get.toNamed(
                                              MyTransactionScreen.routeName);
                                        },
                                        icon: Icons.navigate_next_sharp,
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            },
          );
        },
      ),
    );
  }

  profileSell({
    required String img,
    required String text,
    required void Function() onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Image.asset(
                  img,
                  height: 18,
                  width: 26,
                  color: AppColors.appBlueColor,
                ),
                const SizedBox(width: 15),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  icon,
                  size: 35,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
