import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rownd_flutter_plugin/rownd.dart';
import 'package:rownd_flutter_plugin/rownd_platform_interface.dart';
import 'package:rownd_flutter_plugin/state/global_state.dart';
import 'package:tralever_module/custem_class/constant/app_images.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/base_screen/view/base_screen.dart';
import 'package:tralever_module/ui/screen/login/controller/login_controller.dart';
import 'package:tralever_module/ui/screen/settings_screen/controller/about_screen_controller.dart';
import 'package:tralever_module/ui/shared/material_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../custem_class/constant/app_colors.dart';
import '../../../../custem_class/constant/app_functions.dart';
import '../../../shared/textfild_common.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/LoginScreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.find<LoginController>();
  AboutScreenController aboutScreenController =
      Get.find<AboutScreenController>();
  bool disposed = false;

  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      flutterToast("Press again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  final _rownd = RowndPlugin();
  @override
  void initState() {
    super.initState();

    /// Rownd key
    /// e2f1fafb-228f-4eb7-85b7-8e784aa12567
    // _rownd.configure(
    //   "e2f1fafb-228f-4eb7-85b7-8e784aa12567",
    // );
    _rownd.configure(rowndAppKey);
  }
  //
  // @override
  // void dispose() {
  //   disposed = true;
  //   super.dispose();
  // }
  //
  // @override
  // void notifyListeners() {
  //   if (!disposed) {
  //     notifyListeners();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          builder: (LoginController loginController) {
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.loginBackgroundImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Center(
                    child: Image.asset(
                      AppImages.splashScreenLogo,
                      width: 252,
                      height: 79,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        color: Colors.white),
                    child: Form(
                      key: loginController.loginKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: FormInputTextfield(
                              focusNode: FocusNode(
                                  canRequestFocus: false,
                                  descendantsAreFocusable: false),
                              formFieldType: FormFieldType.email,
                              textCapitalization: TextCapitalization.none,
                              textInputAction: TextInputAction.done,
                              controller: loginController.emailTextController,
                              validator: (val) => validateEmail(val?.trim()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      checkColor:
                                          MaterialStateProperty.resolveWith(
                                        (_) => AppColors.appBlueColor,
                                      ),
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              (_) => Colors.transparent),
                                      side: AlwaysActiveBorderSide(),
                                    ),
                                  ),
                                  child: Checkbox(
                                      value: loginController.isChecked,
                                      onChanged: (bool? value) {
                                        loginController.isChecked = value!;
                                      }),
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "I agree to the ".tr,
                                      style: const TextStyle(
                                        fontFamily: kAppFont,
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "Terms & Conditions".tr,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              var url = (aboutScreenController
                                                  .appDetailDataModel!
                                                  .termsAndConditions);
                                              launch(url);
                                            },
                                          style: const TextStyle(
                                            fontFamily: kAppFont,
                                            fontSize: 14,
                                            decoration:
                                                TextDecoration.underline,
                                            color: AppColors.appBlueColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " of Onsite.".tr,
                                          style: const TextStyle(
                                            fontFamily: kAppFont,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: ChangeNotifierProvider.value(
                              value: _rownd.state(),
                              builder: (context, child) {
                                return Consumer<GlobalStateNotifier>(
                                    builder: (_, rownd, __) {
                                  // if (rownd.state.auth?.accessToken != null) {
                                  //   print("ROWND SIGNIn=====>");
                                  //   Get.toNamed(BaseScreen.routeName);
                                  // }
                                  return materialButton(
                                    onTap: () async {
                                      if (loginController.loginKey.currentState!
                                          .validate()) {
                                        disposeKeyboard();
                                        if (loginController.isChecked == true) {
                                          // if (rownd.state.auth?.isAuthenticated ??
                                          //     true) {
                                          if (rownd.state.auth?.accessToken !=
                                              null) {
                                            userController
                                                .rowndSignIn(
                                                    token:
                                                        "${rownd.state.auth?.accessToken}")
                                                .then((value) {
                                              print(
                                                  "ROWND-ACCESS-TOKEN----->${rownd.state.auth?.accessToken}");
                                              userController.rowndAcessToken =
                                                  rownd.state.auth?.accessToken;
                                              print(
                                                  "usercontroller token--->${userController.rowndAcessToken}");

                                              Get.offAllNamed(
                                                  BaseScreen.routeName);
                                            });
                                          } else {
                                            signin()?.then((value) {
                                              // Navigator.pop(context);
                                              // Navigator.pop(context);
                                              // if (rownd.state.auth?.accessToken !=
                                              //     null) {
                                              userController
                                                  .rowndSignIn(
                                                      token:
                                                          "${rownd.state.auth?.accessToken}")
                                                  .then((value) =>
                                                      Get.offAllNamed(BaseScreen
                                                          .routeName));
                                              // }
                                            });
                                          }
                                        } else {
                                          flutterToast(
                                              "Please agree Terms and conditions");
                                        }
                                      }
                                    },
                                    text: 'Get Started',
                                  );
                                });
                              },
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: kDefaultPadding),
                          //   child: materialButton(
                          //       onTap: () {
                          //         if (loginController.loginKey.currentState!
                          //             .validate()) {
                          //           ///  rownd API
                          //           if (rownd.state.auth?.isAuthenticated ??
                          //               false) {
                          //             _rownd.signOut();
                          //           } else {
                          //             RowndSignInOptions signInOpts =
                          //                 RowndSignInOptions();
                          //             signInOpts.postSignInRedirect =
                          //                 loginController.userLogin().toString();
                          //             // APIRoutes.login;
                          //             //"https://deeplink.myapp.com";
                          //             _rownd.requestSignIn(signInOpts);
                          //           }
                          //           disposeKeyboard();
                          //           if (loginController.isChecked == true) {
                          //             ///   loginController.userLogin();
                          //
                          //             Get.toNamed(BaseScreen.routeName);
                          //           } else {
                          //             flutterToast(
                          //                 "Please agree Terms and conditions");
                          //           }
                          //         }
                          //       },
                          //       text: "Get Started"),
                          // ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future? signin() {
    RowndSignInOptions signInOpts = RowndSignInOptions();
    _rownd.requestSignIn(signInOpts);
    signInOpts.postSignInRedirect = "https://www.google.com";
  }
}

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  @override
  BorderSide? resolve(_) => const BorderSide(width: 1.3, color: Colors.grey);
}
