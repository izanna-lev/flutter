import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';

import '../../../../custem_class/constant/app_images.dart';
import '../../../../custem_class/constant/app_settings.dart';
import '../../../../custem_class/utils/local_storage.dart';
import '../../../../custem_class/utils/size_config.dart';
import '../../../shared/material_button.dart';
import '../controller/onboarding_controller.dart';
import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "/OnBoardingScreen";

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OnBoardingController onBoardingController = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SizeConfig.init(context);
    LocalStorage.saveOnBoarding();
    return Scaffold(
      body: GetBuilder(
        builder: (OnBoardingController onBoardingController) {
          return Column(
            children: [
              Expanded(
                flex: 6,
                child: PageView(
                  controller: onBoardingController.pageController,
                  onPageChanged: (val) {
                    onBoardingController.index = val;
                  },
                  children: [
                    Column(
                      children: [
                        //Spacer(),
                        const SizedBox(height: 46),
                        onBodingImg(img: AppImages.onBoardingImage1),
                        // Spacer(),
                      ],
                    ),
                    Column(
                      children: [
                        // Spacer(),
                        const SizedBox(height: 30),

                        onBodingImg(img: AppImages.onBoardingImage3),
                        //Spacer(),
                      ],
                    ),
                    Column(
                      children: [
                        //Spacer(),
                        const SizedBox(height: 36),
                        onBodingImg(img: AppImages.onBoardingImage2),
                        //Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: SizedBox.expand(
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      // Swiping in right direction.
                      if (details.delta.dx > 0) {
                        onBoardingController.pageController
                            .previousPage(
                          duration:
                          kOnBoardingPageAnimationDuration,
                          curve: Curves.ease,
                        );
                      }

                      // Swiping in left direction.
                      if (details.delta.dx < 0) {
                        onBoardingController.pageController
                            .nextPage(
                          duration:
                          kOnBoardingPageAnimationDuration,
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Column(
                      children: [
                        onBoardingController.index == 3 - 1
                            ? onBodingTextCommon(
                          title:
                          "View all your personalized travel plans in one place",
                        )
                            : onBoardingController.index == 2 - 1
                            ? onBodingTextCommon(
                          title:
                          "Get connected and chat with your personal travel concierge ",
                        )
                            : onBodingTextCommon(
                          title:
                          "Submit a trip request to your desired destination",
                        ),
                        const Spacer(),
                        buildPagination(),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: onBoardingController.index == 3 - 1
                              ? materialButton(
                            onTap: () {
                              Get.toNamed(LoginScreen.routeName);
                            },
                            text: 'Get Started',
                          )
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: materialButtonWithBorder(
                                  onTap: () {
                                    onBoardingController.pageController
                                        .nextPage(
                                      duration:
                                      kOnBoardingPageAnimationDuration,
                                      curve: Curves.ease,
                                    );
                                    Get.toNamed(LoginScreen.routeName);
                                  },
                                  text: "Skip",
                                ),
                              ),
                              const SizedBox(width: 13),
                              Expanded(
                                child: materialButton(
                                  onTap: () {
                                    onBoardingController.pageController
                                        .nextPage(
                                      duration:
                                      kOnBoardingPageAnimationDuration,
                                      curve: Curves.ease,
                                    );
                                  },
                                  text: "Next",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  onBodingImg({required String img}) {
    return Image.asset(img, fit: BoxFit.cover
      // height: getHeight(height),
      // width: getWidth(width),
    );
  }

  onBodingTextCommon({required String title, double? int}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Text(
            title.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: kAppFont,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          //  SizedBox(height: getHeight(20)),
          // Text(
          //   detail.tr,
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(
          //     fontFamily: kAppFont,
          //     fontWeight: FontWeight.w300,
          //     fontSize: 16,
          //     height: 1.5,
          //   ),
          // ),
          // SizedBox(height: int),
        ],
      ),
    );
  }

  buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          3,
              (index) => AnimatedContainer(
            duration: kOnBoardingPageAnimationDuration,
            margin: EdgeInsets.only(right: index == 3 - 1 ? 0 : 10),
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.appBlueColor,
              ),
              color: index == onBoardingController.index
                  ? AppColors.appBlueColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          )),
      //     children: List.generate(
      // 3,
      // (index) => AnimatedContainer(
      //       duration: kOnBoardingPageAnimationDuration,
      //       margin: EdgeInsets.only(right: index == 3 - 1 ? 0 : 10),
      //       width: 12,
      //       height: 12,
      //       decoration: BoxDecoration(
      //         color: index == onBoardingController.index
      //             ? AppColors.appBlueColor
      //             : Colors.red,
      //         borderRadius: BorderRadius.circular(8),
      //       ),
      //     )),
    );
  }
}

const kOnBoardingPageAnimationDuration = Duration(milliseconds: 600);
