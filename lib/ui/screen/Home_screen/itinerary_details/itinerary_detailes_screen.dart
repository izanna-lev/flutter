import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/activity_details_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/additional_information.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/cancellation_policy_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/car/car_ticket_deatils_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/ferrry/ferry_ticket_deatils_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/flight/flight_tickets_details_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/hotel_rservations_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/rate_your_experience.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/required_information_Screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/restaurant_reservations_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/train/train_ticket_deatils_screen.dart';
import 'package:tralever_module/ui/shared/appbar.dart';
import 'package:tralever_module/ui/shared/dilog_box.dart';
import 'package:tralever_module/ui/shared/material_button.dart';

import '../../../../custem_class/utils/size_config.dart';

class ItineraryDetailScreen extends StatefulWidget {
  static const String routeName = "/ItineraryDetailScreen";

  const ItineraryDetailScreen({Key? key}) : super(key: key);

  @override
  State<ItineraryDetailScreen> createState() => _ItineraryDetailScreenState();
}

class _ItineraryDetailScreenState extends State<ItineraryDetailScreen> {
  List<String> date = [
    "Oct 11",
    "Oct 12",
    "Oct 13",
    "Oct 14",
    "Oct 15",
    "Oct 16",
    "Oct 16",
    "Oct 16",
    "Oct 17"
  ];
  List<String> icon = [
    AppIcons.flightIcon,
    AppIcons.hotelIcon,
    AppIcons.restaurantIcon,
    AppIcons.activitiesIcon,
    AppIcons.requestInfoIcon,
    AppIcons.ferryIcon,
    AppIcons.trainIcon,
    AppIcons.carIcon,
  ];
  List<String> detail = [
    "JFK—> MIA 12:00pm flight",
    "Check in Hotel Blue Star 4:00pm",
    "Chinese Restaurant 7:00pm",
    "Perez Art Museum",
    "Required Information",
    "Seco Island - Full Day Tour",
    "Paco Train Station",
    "Road trip to paco station"
  ];

  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();

  @override
  void initState() {
    itineraryDetailScreenController.itineraryDetails(
      itineraryRef: itineraryDetailScreenController
              .itineraryDetailsListModel?.itinerary[0].id ??
          "",
      timezone: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Itinerary Details"),
      body: GetBuilder(
        builder:
            (ItineraryDetailScreenController itineraryDetailScreenController) {
          return Stack(
            children: [
              imageContainer(),
              SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 210,
                        width: double.infinity,
                      ),
                      imageContainerDetail()
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  imageContainer() {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            itineraryDetailScreenController.itineraryDetailsListModel?.image
                    .toString() ??
                "https://images.allthingsnature.org/moss-on-stones-around-a-waterfall.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  imageContainerDetail() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      itineraryDetailScreenController
                                  .itineraryDetailsListModel?.itineraryStatus ==
                              1
                          ? Image.asset(
                              AppIcons.onGoingIcon,
                              height: 47,
                            )
                          : itineraryDetailScreenController
                                      .itineraryDetailsListModel
                                      ?.itineraryStatus ==
                                  2
                              ? Image.asset(
                                  AppIcons.statusUpcoming,
                                  height: 47,
                                )
                              : itineraryDetailScreenController
                                          .itineraryDetailsListModel
                                          ?.itineraryStatus ==
                                      3
                                  ? Image.asset(
                                      AppIcons.cancelledIcon,
                                      height: 47,
                                    )
                                  : itineraryDetailScreenController
                                              .itineraryDetailsListModel
                                              ?.itineraryStatus ==
                                          5
                                      ? Image.asset(
                                          AppIcons.completedIcon,
                                          height: 47,
                                        )
                                      : Container(
                                          height: 50,
                                          width: 50,
                                          color: Colors.red,
                                        ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Status"),
                          itineraryDetailScreenController
                                      .itineraryDetailsListModel
                                      ?.itineraryStatus ==
                                  1
                              ? statusText(text: "Ongoing")
                              : itineraryDetailScreenController
                                          .itineraryDetailsListModel
                                          ?.itineraryStatus ==
                                      2
                                  ? statusText(text: "Upcoming")
                                  : itineraryDetailScreenController
                                              .itineraryDetailsListModel
                                              ?.itineraryStatus ==
                                          3
                                      ? statusText(text: "cancelled")
                                      : itineraryDetailScreenController
                                                  .itineraryDetailsListModel
                                                  ?.itineraryStatus ==
                                              5
                                          ? statusText(text: "Completed")
                                          : statusText(text: "not showing")
                        ],
                      ),
                      const Spacer(),
                      itineraryDetailScreenController
                                  .itineraryDetailsListModel?.approved ??

                              ///false
                              true
                          ? GestureDetector(
                              onTap: () {
                                requestDialogBox();
                              },
                              child: const Text(
                                "Request Cancellation",
                                style: TextStyle(
                                  fontFamily: kAppFont,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            chatButton(onTap: () {}),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  itineraryDetailScreenController
                          .itineraryDetailsListModel?.name
                          .toString() ??
                      "The Surat",
                  // "The Philippines",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  itineraryDetailScreenController
                          .itineraryDetailsListModel?.price
                          .toString() ??
                      "\$2500",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // itemCount: date.length,
                  ///dummy date
                  itemCount: itineraryDetailScreenController
                          .itineraryDetailsListModel?.dates.length ??

                      /// dummy date
                      date.length,
                  // itemCount: date.length,
                  //shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    print(
                        "ITINERARY_DETAILS===>${itineraryDetailScreenController.itineraryDetailsListModel?.name}");
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            itineraryDetailScreenController.selectValue = index;
                            print(
                                'ItineraryDetailScreenController=======>${itineraryDetailScreenController.selectValue}');
                            if (itineraryDetailScreenController.selectValue ==
                                index) {
                              itineraryDetailScreenController.update();
                              itineraryDetailScreenController
                                  .itineraryDetailsListModel
                                  ?.itinerary[index]
                                  .name;
                              print(
                                  'ITINERARY_NAME====>${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[index].name}');
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                                itineraryDetailScreenController.selectValue ==
                                        index
                                    ? AppColors.appBlueColor
                                    : const Color(0xffd6f2fa),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                itineraryDetailScreenController
                                        .itineraryDetailsListModel?.dates[index]
                                        .toString() ??
                                    "oct11",

                                // date[index],
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: itineraryDetailScreenController
                                              .selectValue ==
                                          index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 15),

            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itineraryDetailScreenController
                        .itineraryDetailsListModel?.itinerary.length

                    /// Dummy Data Displaying
                    ??
                    icon.length,

                ///   itemCount: icon.length,
                itemBuilder: (BuildContext context, int index) {
                  var type = itineraryDetailScreenController
                          .itineraryDetailsListModel
                          ?.itinerary[index]
                          .detailType ??
                      "";
                  var itineraryId = itineraryDetailScreenController
                          .itineraryDetailsListModel?.itinerary[index].id ??
                      "";
                  var name = itineraryDetailScreenController
                          .itineraryDetailsListModel?.itinerary[index].name ??
                      "";
                  return TimelineTile(
                    isFirst: index == 0 ? true : false,
                    isLast: index == icon.length - 1 ? true : false,
                    afterLineStyle: const LineStyle(thickness: 1.5),
                    beforeLineStyle: const LineStyle(thickness: 1.5),
                    indicatorStyle: IndicatorStyle(
                      width: 28,
                      height: 28,
                      indicator: Image.asset(
                        index == 0 && type == 4
                            ? AppIcons.flightIcon
                            : index == 1 && type == 1
                                ? AppIcons.hotelIcon
                                : index == 2 && type == 2
                                    ? AppIcons.restaurantIcon
                                    : index == 3 && type == 3
                                        ? AppIcons.activitiesIcon
                                        : index == 4 && type == 8
                                            ? AppIcons.notificationRound
                                            : index == 5 && type == 6
                                                ? AppIcons.ferryIcon
                                                : index == 6 && type == 5
                                                    ? AppIcons.trainIcon
                                                    : index == 7 && type == 7
                                                        ? AppIcons.carIcon
                                                        : AppIcons.carIcon,
                      ),
                    ),
                    alignment: TimelineAlign.manual,
                    lineXY: 0.35,
                    endChild: Row(
                      children: [
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            if (index == 0 && type == 4) {
                              itineraryDetailScreenController
                                  .itineraryDetails(
                                    itineraryRef: itineraryId,
                                    timezone: 4, //
                                  )
                                  .then((value) => Get.toNamed(
                                      FlightTicketsDetailsScreen.routeName));
                            } else if (index == 1 && type == 1) {
                              itineraryDetailScreenController
                                  .itineraryDetails(
                                    itineraryRef: itineraryId,
                                    timezone: 1,
                                  )
                                  .then((value) => Get.toNamed(
                                      HotelReservationsScreen.routeName));
                            } else if (index == 2 && type == 2) {
                              itineraryDetailScreenController
                                  .itineraryDetails(
                                    itineraryRef: itineraryId,
                                    timezone: 2,
                                  )
                                  .then((value) => Get.toNamed(
                                      RestaurantReservationsScreen.routeName));
                            } else if (index == 3 && type == 3) {
                              itineraryDetailScreenController
                                  .itineraryDetails(
                                    itineraryRef: itineraryId,
                                    timezone: 3,
                                  )
                                  .then((value) => Get.toNamed(
                                      ActivityDetailsScreen.routeName));
                            } else if (index == 4 && type == 8) {
                              itineraryDetailScreenController
                                  .itineraryDetails(
                                    itineraryRef: itineraryId,
                                    timezone: 8,
                                  )
                                  .then((value) => Get.toNamed(
                                      RequiredInformationScreen.routeName));
                            } else if (index == 5 && type == 6) {
                              itineraryDetailScreenController
                                  .itineraryDetails(
                                    itineraryRef: itineraryId,
                                    timezone: 6,
                                  )
                                  .then((value) => Get.toNamed(
                                      FerryTicketDetailsScreen.routeName));
                            } else if (index == 6 && type == 5) {
                              itineraryDetailScreenController
                                  .itineraryDetails(
                                    itineraryRef: itineraryId,
                                    timezone: 5,
                                  )
                                  .then((value) => Get.toNamed(
                                      TrainTicketDetailsScreen.routeName));
                            } else if (index == 7 && type == 7) {
                              itineraryDetailScreenController
                                  .itineraryDetails(
                                    itineraryRef: itineraryId,
                                    timezone: 7,
                                  )
                                  .then((value) => Get.toNamed(
                                      CarTicketDetailsScreen.routeName));
                            } else {
                              /// data is blank this screen is dummy Screen
                              Get.toNamed(FerryTicketDetailsScreen.routeName);
                            }
                          },
                          child: Text(
                            index == 0 && type == 4
                                ? name
                                : index == 1 && type == 1
                                    ? name
                                    : index == 2 && type == 2
                                        ? name
                                        : index == 3 && type == 3
                                            ? name
                                            : index == 4 && type == 8
                                                ? name
                                                : index == 5 && type == 6
                                                    ? name
                                                    : index == 6 && type == 5
                                                        ? name
                                                        : index == 7 &&
                                                                type == 7
                                                            ? name
                                                            : "Dummy Text",
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    startChild: Row(
                      children: [
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 15),
                            index == 4
                                ? const Text("Notes")
                                : Text(
                                    itineraryDetailScreenController
                                            .itineraryDetailsListModel
                                            ?.itinerary[index]
                                            .date
                                            .toString() ??
                                        "15:12",
                                  ),
                            Text(
                              itineraryDetailScreenController
                                      .itineraryDetailsListModel
                                      ?.itinerary[index]
                                      .date
                                      .toString() ??
                                  "10/10/2022",
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  );
                }),
            const SizedBox(height: 20),

            ///  materialButton
            ///  Approve Button

            itineraryDetailScreenController
                        .itineraryDetailsListModel?.approved ??
                    false == false
                ? Row(
                    children: [
                      Expanded(
                        child: materialButton(
                          onTap: () {
                            itineraryDetailScreenController
                                        .itineraryDetailsListModel?.card ??
                                    true
                                ? cardNotAddedApproveDialogBox()
                                : cardAddApproveDialogBox();

                            ///Get.toNamed(ManagePaymentScreen.routeName);
                          },
                          text: "Approve",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: materialButtonWithBorder(
                          onTap: () {},
                          text: "Request Edits",
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),

            const SizedBox(height: 20),
            const Text(
              "Rate Your Experience",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  unratedColor: const Color(0xffE4E4E4),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    Get.toNamed(RateYourExperience.routeName);
                    print(rating);
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AdditionalInformationScreen.routeName);
                  },
                  child: const Text(
                    "Additional Information & Travel Restrictions",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      color: AppColors.appBlueColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  requestDialogBox() {
    return showCustomDialogItinerary(
      context: context,
      title: "Cancel Trip",
      content:
          "Are you sure you want to request a cancellation? Different reservations will have different policies. Inform your specialist through chat.",
      policyText: "Cancellation Policy",
      contentSize: 1,
      policyTextOnTap: () {
        Get.toNamed(CancellationPolicyScreen.routeName);
      },
      noonTap: () {
        Get.back();
      },
      yesonTap: () {
        Get.back();
      },
      color: AppColors.appBlueColor,
      okText: "Confirm & Chat",
      noText: "Cancel",
    );
  }

  cardNotAddedApproveDialogBox() {
    return showCustomDialogLogOut(
      context: context,
      title: "Are you sure you’re ready to approve?",
      content:
          "By clicking approve, you are letting your specialist know that you are happy with the itinerary provided and ready to pay the amount listed. Your selected payment method will be charged ${itineraryDetailScreenController.itineraryDetailsListModel?.price}  today and your specialist will proceed with bookings. Please click Confirm & Pay to continue.",
      contentSize: 1,
      noonTap: () {
        Get.back();
      },
      yesonTap: () {},
      color: AppColors.appBlueColor,
      okText: "Confirm",
      noText: "Cancel",
    );
  }

  cardAddApproveDialogBox() {
    return showCustomDialogLogOut(
      context: context,
      title: "Are you sure you’re ready to approve?",
      content:
          "By clicking approve, you are letting your specialist know that you are happy with the itinerary provided and ready to pay the amount listed. Your selected payment method will be charged \$2500 today and your specialist will proceed with bookings. Please click Confirm & Pay to continue.",
      contentSize: 1,
      noonTap: () {
        Get.back();
      },
      yesonTap: () {},
      color: AppColors.appBlueColor,
      okText: "Confirm",
      noText: "Cancel",
    );
  }

  statusText({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
    );
  }
}
