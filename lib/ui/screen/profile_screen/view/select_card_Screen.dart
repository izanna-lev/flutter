import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/constant/app_functions.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/add_card_controller.dart';
import 'package:tralever_module/ui/shared/appbar.dart';
import '../../../../custem_class/constant/app_icons.dart';
import '../../../../models/home/itinerary_approve_model.dart';
import '../../../shared/dilog_box.dart';
import '../../../shared/material_button.dart';
import '../../Home_screen/controller/home_controller.dart';

class SelectCardScreen extends StatefulWidget {
  static const String routeName = "/SelectCardScreen";

  const SelectCardScreen({Key? key}) : super(key: key);

  @override
  State<SelectCardScreen> createState() => _SelectCardScreenState();
}

class _SelectCardScreenState extends State<SelectCardScreen> {
  @override
  void initState() {
    addCardController.cardList = [];
    addCardController.cardListShow();
    super.initState();
  }

  AddCardController addCardController = Get.find<AddCardController>();
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Select Card"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: GetBuilder(
          builder: (AddCardController addCardController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Note: Please select card to continue.",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Column(
                    children: List.generate(
                      addCardController.cardList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: const Color(0xffEBEBEB))),
                          child: CheckboxListTile(
                              activeColor: Colors.transparent,
                              checkColor: AppColors.appBlueColor,
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              dense: true,
                              title: Row(
                                children: [
                                  Image.asset(
                                    AppIcons.cardIcon,
                                    height: 23,
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    "XXX-XXX-XXX-${addCardController.cardList[index].lastDigitsOfCard}",
                                    //  "XXX-XXX-XXX-XXX",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              value: addCardController
                                  .cardList[index].selectedCard,
                              onChanged: (value) {
                                setState(() {
                                  int tempIndex = addCardController.cardList
                                      .indexWhere((element) =>
                                          element.selectedCard == true);
                                  if (tempIndex != -1) {
                                    addCardController.cardList[tempIndex]
                                        .selectedCard = false;
                                  }
                                  addCardController
                                      .cardList[index].selectedCard = true;
                                });
                              }),
                        ),
                      ),
                    ),
                  ),
                ),
                materialButton(
                  onTap: () async {
                    int index = addCardController.cardList
                        .indexWhere((element) => element.selectedCard == true);
                    if (index == -1) {
                      flutterToast("Please select card");
                      return;
                    }
                    // var response = await
                    var response = await itineraryDetailScreenController.itineraryApprove(
                      itineraryRef: itineraryDetailScreenController
                          .itineraryDetailsListModel!.id
                          .toString(),
                      cardRef: addCardController.cardList[index].id,
                    );
                    if(response != null) {
                      if(homeController.pendingPlansData.length > 0) {
                        int index = homeController.pendingPlansData.indexWhere((element) => element.id == itineraryDetailScreenController
                            .itineraryDetailsListModel!.id);
                        if(index != -1) {
                          homeController.pendingPlansData[index].approved = true;
                          homeController.update();
                        }
                      }
                      dialogBox();
                    }
                    // if (response != null) {
                    //   Get.back();
                    // }
                  },
                  text: "Confirm Payment",
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
  dialogBox() {
    return showCustomDialog(
      title: "Payment Successful!",
      context: context,
      content: "You will be redirected to the home screen",
      contentSize: 1,
      onTap: () {
        Get.back();
        Get.back();
        Get.back();
      },
      color: AppColors.appBlueColor,
      okText: "OK",
    );
  }
}
// ListView.builder(
//   itemCount: 5,
//   itemBuilder: (BuildContext context, int index) {
//     return Container(
//       height: 65,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(
//           color: const Color(0xffEBEBEB),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//             horizontal: kDefaultPadding),
//         child: Row(
//           children: [
//             Container(
//               height: 30,
//               width: 30,
//               color: Colors.black,
//             ),
//             const SizedBox(width: 15),
//             Image.asset(
//               AppIcons.cardIcon,
//               height: 23,
//             ),
//             const SizedBox(width: 15),
//             const Text(
//               //"XXX-XXX-XXX-${addCardController.cardList[index].lastDigitsOfCard}",
//               "XXX-XXX-XXX-XXX",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   },
// ),
