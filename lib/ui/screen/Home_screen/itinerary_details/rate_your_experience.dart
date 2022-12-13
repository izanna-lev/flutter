import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
import 'package:tralever_module/ui/shared/appbar.dart';
import 'package:tralever_module/ui/shared/dilog_box.dart';
import 'package:tralever_module/ui/shared/material_button.dart';

import '../../../../custem_class/constant/app_functions.dart';
import '../../../../custem_class/utils/size_config.dart';

class RateYourExperience extends StatefulWidget {
  static const String routeName = "/RateYourExperience";

  RateYourExperience({Key? key}) : super(key: key);
  var data = Get.arguments;

  @override
  State<RateYourExperience> createState() => _RateYourExperienceState();
}

class _RateYourExperienceState extends State<RateYourExperience> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();

  @override
  void initState() {
    widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: commonAppbar(titleText: "Rate Your Experience"),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GetBuilder(
              builder: (ItineraryDetailScreenController
                  itineraryDetailScreenController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    rateText(text: "Rate Overall Experience"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          //  initialRating: 1,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          unratedColor: const Color(0xffE4E4E4),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            itineraryDetailScreenController.overallRating =
                                rating;
                            print(
                                "overallRating-------->${itineraryDetailScreenController.overallRating}");
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    rateText(text: "Rate Specialist Experience"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          // initialRating: 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          unratedColor: const Color(0xffE4E4E4),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            itineraryDetailScreenController.specialistRating =
                                rating;
                            print(rating);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    rateText(text: "Rate Value Experience"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          //  initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          unratedColor: const Color(0xffE4E4E4),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            itineraryDetailScreenController.valueRating =
                                rating;
                            print(
                                "valueRating-------->${itineraryDetailScreenController.valueRating}");
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    materialButton(
                      onTap: () async {
                        // var response =
                        if (itineraryDetailScreenController.overallRating ==
                                null ||
                            itineraryDetailScreenController.specialistRating ==
                                null ||
                            itineraryDetailScreenController.valueRating ==
                                null) {
                          flutterToast("Please select some ratings.");
                          print('else  rating');
                        } else {
                          itineraryDetailScreenController
                              .ratingDetails(
                                  itineraryRef: widget.data,
                                  experience: itineraryDetailScreenController
                                      .overallRating!,
                                  specialist: itineraryDetailScreenController
                                      .specialistRating!,
                                  value: itineraryDetailScreenController
                                      .valueRating!)
                              .then((value) => dialogBox());
                          print('if rating');
                        }
                      },
                      text: "Submit",
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            )));
  }

  dialogBox() {
    return showCustomDialog(
      context: context,
      content: "Your Ratings has been submitted successfully.",
      contentSize: 1,
      onTap: () {
        Get.back();
        Get.back();
        itineraryDetailScreenController.itineraryDetails(
          itineraryRef: widget.data,
        );
      },
      color: AppColors.appBlueColor,
      okText: "Ok",
    );
  }

  rateText({required String text}) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
