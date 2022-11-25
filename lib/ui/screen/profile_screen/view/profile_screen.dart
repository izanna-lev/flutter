import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/profile_controller.dart';
import 'package:tralever_module/ui/screen/profile_screen/view/manage_payment_screen.dart';
import 'package:tralever_module/ui/screen/profile_screen/view/my_transactions_screen.dart';
import '../../../../custem_class/constant/app_colors.dart';
import '../../../../custem_class/constant/app_images.dart';
import '../../../../custem_class/utils/globle.dart';
import '../../../../services/api_routes.dart';
import '../../../shared/image_picker_controller.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "/ProfileScreen";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfilerController profilerController = Get.find<ProfilerController>();

  late String currImageUrl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // currImageUrl = imageUrl + userController.userModel!.user.image;
    currImageUrl = AppImages.loginBackgroundImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          profileDetails(context),
          SingleChildScrollView(
            child: GetBuilder(
              builder: (ProfilerController profilerController) {
                return Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 320),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                const Text(
                                  "Steve Walter",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "example@gmail.com",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                profileSell(
                                  img: AppIcons.manageCardIcon,
                                  text: "Manage Payment Methods",
                                  onTap: () {
                                    Get.toNamed(ManagePaymentScreen.routeName);
                                  },
                                  icon: Icons.navigate_next_sharp,
                                ),
                                const SizedBox(height: 10),
                                profileSell(
                                  img: AppIcons.transactionsIcon,
                                  text: "My Transactions",
                                  onTap: () {
                                    Get.toNamed(MyTransactionScreen.routeName);
                                  },
                                  icon: Icons.navigate_next_sharp,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget profileDetails(BuildContext context) {
    return GetBuilder(builder: (ImagePickerController imagePickerController) {
      if (currImageUrl != imagePickerController.image &&
          imagePickerController.image.isNotEmpty) {
        currImageUrl = imagePickerController.image;

        /// call api
        profilerController.editProfile();
        print("CALL API");
      }
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              appImagePicker.openBottomSheet();
            },
            child: imagePickerController.image.isEmpty
                //     ? userController.userModel?.user.picture == ""
                ? Image.asset(
                    currImageUrl,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                //     : CircleAvatar(
                //   radius: 60,
                //   backgroundColor: Colors.transparent,
                //   backgroundImage: NetworkImage(currImageUrl),
                // )
                : Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(
                          File(imagePickerController.image),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
        ],
      );
    });
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
