import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/custem_class/utils/local_storage.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/services/over&loding.dart';
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
import 'package:tralever_module/ui/screen/profile_screen/view/add_card_screen.dart';
import 'package:tralever_module/ui/shared/appbar.dart';
import 'package:tralever_module/ui/shared/dilog_box.dart';
import 'package:tralever_module/ui/shared/material_button.dart';

import '../../../../custem_class/constant/app_functions.dart';
import '../../../../custem_class/utils/appenum.dart';
import '../../../../custem_class/utils/size_config.dart';
import '../../chats/view/message_screen.dart';
import '../../profile_screen/view/select_card_Screen.dart';

class ItineraryDetailScreen extends StatefulWidget {
  static const String routeName = "/ItineraryDetailScreen";

  ItineraryDetailScreen({Key? key}) : super(key: key);
  var data = Get.arguments;

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
    "JFK???> MIA 12:00pm flight",
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
  double initialRating = 0;
  var itineraryDetailsID = Get.arguments;

  @override
  void initState() {
    var itineraryId = widget.data;

    itineraryDetailScreenController.itineraryDetails(
      itineraryRef: itineraryId,
    );
    print('itineraryId===>${itineraryId}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: commonAppbar(titleText: "Itinerary Details"),
        body: GetBuilder(
          builder: (ItineraryDetailScreenController
              itineraryDetailScreenController) {
            return itineraryDetailScreenController
                        .itineraryDetailsListModel?.id !=
                    null
                ? Stack(
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
                              imageContainerDetail(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const AppLoader();
          },
        ));
  }

  imageContainer() {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              '$imageUrl${itineraryDetailScreenController.itineraryDetailsListModel?.image}'
              // "https://images.allthingsnature.org/moss-on-stones-around-a-waterfall.jpg"
              ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  imageContainerDetail() {
    return GetBuilder(
      builder:
          (ItineraryDetailScreenController itineraryDetailScreenController) {
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
            padding: const EdgeInsets.symmetric(horizontal: 19),
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
                                      .itineraryDetailsListModel
                                      ?.itineraryStatus ==
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
                                          .itineraryDetailsListModel!
                                          .itineraryStatus ==
                                      2 &&
                                  itineraryDetailScreenController
                                          .itineraryDetailsListModel!
                                          .approved ==
                                      true
                              ? GestureDetector(
                                  onTap: () {
                                    itineraryDetailScreenController
                                                .itineraryDetailsListModel
                                                ?.cancellationRequest ==
                                            false
                                        ? requestDialogBox()
                                        : null;
                                  },
                                  child: Text(
                                    itineraryDetailScreenController
                                                .itineraryDetailsListModel
                                                ?.cancellationRequest ==
                                            false
                                        ? "Request Cancellation"
                                        : "Cancellation Requested",
                                    style: const TextStyle(
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
                itineraryDetailScreenController
                                .itineraryDetailsListModel!.itineraryStatus ==
                            3 ||
                        itineraryDetailScreenController
                                .itineraryDetailsListModel!.itineraryStatus ==
                            5
                    ? const SizedBox()
                    : chatButton(onTap: () async {
                        getChannelId();
                      }),
                itineraryDetailScreenController
                                .itineraryDetailsListModel!.itineraryStatus ==
                            3 ||
                        itineraryDetailScreenController
                                .itineraryDetailsListModel!.itineraryStatus ==
                            5
                    ? const SizedBox()
                    : const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itineraryDetailScreenController
                          .itineraryDetailsListModel!.name
                          .toString(),
                      // "The Philippines",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '\$${itineraryDetailScreenController.itineraryDetailsListModel?.price}',
                      // "\$2500"
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
                          .itineraryDetailsListModel?.dates.length,
                      // itemCount: date.length,
                      //shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: GestureDetector(
                            onTap: () {
                              // setState(() {
                              itineraryDetailScreenController.selectValue =
                                  index;
                              print(
                                  'ItineraryDetailScreenController=======>${itineraryDetailScreenController.selectValue}');
                              // if (itineraryDetailScreenController.selectValue ==
                              //     index) {
                              //   itineraryDetailScreenController.update();
                              //   // itineraryDetailScreenController
                              //   //     .itineraryDetailsListModel
                              //   //     ?.itinerary[index]
                              //   //     .name;
                              // }

                              print('INDEX=====>$index');
                              print(
                                  'itineraryDetailsListModel_ID----->${itineraryDetailScreenController.itineraryDetailsListModel!.id}');
                              itineraryDetailScreenController.itineraryDetails(
                                itineraryRef: itineraryDetailScreenController
                                    .itineraryDetailsListModel!.id,
                                date:
                                    "${itineraryDetailScreenController.itineraryDetailsListModel?.dates[index]}",
                                // timezone: GetLocalTimezone.currentTimeZone
                              );

                              print(
                                  'DATE===>${itineraryDetailScreenController.itineraryDetailsListModel?.dates[index]}');
                              // });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: itineraryDetailScreenController
                                            .selectValue ==
                                        index
                                    ? AppColors.appBlueColor
                                    : const Color(0xffd6f2fa),
                              ),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    dayConverter(
                                        '${itineraryDetailScreenController.itineraryDetailsListModel?.dates[index]}'),

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

                // const SizedBox(height: 20),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: itineraryDetailScreenController
                        .itineraryDetailsListModel?.itinerary.length,

                    ///   itemCount: icon.length,
                    itemBuilder: (BuildContext context, int index) {
                      int type = itineraryDetailScreenController
                              .itineraryDetailsListModel
                              ?.itinerary[index]
                              .detailType ??
                          0;
                      // var itineraryId = widget.data;
                      print('widget.data====>${widget.data}');
                      var itineraryId = itineraryDetailScreenController
                          .itineraryDetailsListModel!.itinerary[index].id;
                      var location = itineraryDetailScreenController
                          .itineraryDetailsListModel!.itinerary[index].location;
                      var name = itineraryDetailScreenController
                          .itineraryDetailsListModel!.itinerary[index].name;
                      var notes = "Required Information";
                      return TimelineTile(
                        isFirst: index == 0 ? true : false,
                        isLast: index ==
                                itineraryDetailScreenController
                                        .itineraryDetailsListModel!
                                        .itinerary
                                        .length -
                                    1
                            ? true
                            : false,
                        afterLineStyle: const LineStyle(
                          thickness: 1.5,
                        ),
                        beforeLineStyle: const LineStyle(thickness: 1.5),
                        indicatorStyle: IndicatorStyle(
                          width: 28,
                          height: 28,
                          indicator: Image.asset(
                            getItineraryDetailStatusIcon(type),
                          ),
                        ),
                        alignment: TimelineAlign.manual,
                        lineXY: 0.35,
                        endChild: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: GestureDetector(
                            onTap: () {
                              if (type == ItineraryDetailStatus.FLIGHT.type) {
                                itineraryDetailScreenController
                                    .itineraryDetails(
                                      itineraryRef: itineraryId,
                                      // timezone: currentTimezone, //
                                    )
                                    .then((value) => Get.toNamed(
                                        FlightTicketsDetailsScreen.routeName,
                                        arguments: index));
                              } else if (type == ItineraryDetailStatus.ACCOMMODATION.type || type == ItineraryDetailStatus.CHECK_OUT.type) {
                                itineraryDetailScreenController
                                    .itineraryDetails(
                                      itineraryRef: itineraryId,
                                      // timezone: currentTimezone,
                                    )
                                    .then((value) => Get.toNamed(
                                        HotelReservationsScreen.routeName,
                                        arguments: index));
                              } else if (type == ItineraryDetailStatus.RESTAURANT.type) {
                                itineraryDetailScreenController
                                    .itineraryDetails(
                                      itineraryRef: itineraryId,
                                      // timezone: currentTimezone,
                                    )
                                    .then((value) => Get.toNamed(
                                        RestaurantReservationsScreen.routeName,
                                        arguments: index));
                              } else if (type == ItineraryDetailStatus.ACTIVITY.type) {
                                itineraryDetailScreenController
                                    .itineraryDetails(
                                      itineraryRef: itineraryId,
                                      // timezone: currentTimezone,
                                    )
                                    .then((value) => Get.toNamed(
                                        ActivityDetailsScreen.routeName,
                                        arguments: index));
                              } else if (type == ItineraryDetailStatus.NOTE.type) {
                                itineraryDetailScreenController
                                    .itineraryDetails(
                                      itineraryRef: itineraryId,
                                      // timezone: currentTimezone,
                                    )
                                    .then((value) => Get.toNamed(
                                        RequiredInformationScreen.routeName,
                                        arguments: index));
                              } else if (type == ItineraryDetailStatus.FERRY.type) {
                                itineraryDetailScreenController
                                    .itineraryDetails(
                                      itineraryRef: itineraryId,
                                      // timezone: currentTimezone,
                                    )
                                    .then((value) => Get.toNamed(
                                        FerryTicketDetailsScreen.routeName,
                                        arguments: index));
                              } else if (type == ItineraryDetailStatus.TRAIN.type) {
                                itineraryDetailScreenController
                                    .itineraryDetails(
                                      itineraryRef: itineraryId,
                                      // timezone: currentTimezone,
                                    )
                                    .then((value) => Get.toNamed(
                                        TrainTicketDetailsScreen.routeName,
                                        arguments: index));
                              } else if (type == ItineraryDetailStatus.CAR.type) {
                                itineraryDetailScreenController
                                    .itineraryDetails(
                                      itineraryRef: itineraryId,
                                      // timezone: currentTimezone,
                                    )
                                    .then((value) => Get.toNamed(
                                        CarTicketDetailsScreen.routeName,
                                        arguments: index));
                              }
                            },
                            child: Text(
                              type == ItineraryDetailStatus.FLIGHT.type
                                  ? location
                                  : type == ItineraryDetailStatus.ACCOMMODATION.type
                                      ? "Check In $name"
                                      : type == ItineraryDetailStatus.RESTAURANT.type
                                          ? name
                                          : type == ItineraryDetailStatus.ACTIVITY.type
                                              ? name
                                              : type == ItineraryDetailStatus.NOTE.type
                                                  ? notes
                                                  : type == ItineraryDetailStatus.FERRY.type
                                                      ? location
                                                      : type == ItineraryDetailStatus.TRAIN.type
                                                          ? location
                                                          : type == ItineraryDetailStatus.CAR.type
                                                              ? location
                                  : type == ItineraryDetailStatus.CHECK_OUT.type
                                  ? "Check Out $name"
                                  : "Dummy Text",
                              maxLines: 2,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        startChild: Row(
                          children: [
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(height: 15),
                                type == 8
                                    ? const Text("Notes")
                                    : Text(getItineraryTime(
                                            '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[index].date}')
                                        // ??
                                        //         "15:12",
                                        ),
                                Text(
                                  getItineraryDate(
                                      '${itineraryDetailScreenController.itineraryDetailsListModel?.itinerary[index].date}'),
                                  // "10/10/2022"
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      );
                    }),

                ///  materialButton
                ///  Approve Button

                itineraryDetailScreenController
                            .itineraryDetailsListModel!.itineraryStatus ==
                        2
                    ? itineraryDetailScreenController
                                .itineraryDetailsListModel!.approved ==
                            false
                        ? Row(
                            children: [
                              Expanded(
                                child: materialButton(
                                  onTap: () {
                                    LocalStorage.isCardAdded() ==
                                            false
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
                                  onTap: () {
                                    getChannelId();
                                  },
                                  text: "Request Edits",
                                ),
                              ),
                            ],
                          )
                        : const SizedBox()
                    : const SizedBox(),

                const SizedBox(height: 8),
                itineraryDetailScreenController
                            .itineraryDetailsListModel?.itineraryStatus ==
                        5
                    ? const Text(
                        "Rate Your Experience",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 10),
                itineraryDetailScreenController
                            .itineraryDetailsListModel?.itineraryStatus ==
                        5
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (itineraryDetailScreenController
                                      .itineraryDetailsListModel!.isRated ==
                                  false) {
                                itineraryDetailScreenController.update();
                                itineraryDetailScreenController
                                                .overallRating !=
                                            null &&
                                        itineraryDetailScreenController
                                                .specialistRating !=
                                            null &&
                                        itineraryDetailScreenController
                                                .valueRating !=
                                            null
                                    ? flutterToast(
                                        "Your Rating is all ready done")
                                    : Get.toNamed(RateYourExperience.routeName,
                                        arguments: widget.data);
                              } else {
                                flutterToast(
                                    "You have already submitted the ratings.");
                              }
                            },
                            child: RatingBar.builder(
                              initialRating: double.parse(
                                  '${itineraryDetailScreenController.itineraryDetailsListModel?.rating}'),
                              // (itineraryDetailScreenController
                              //             .itineraryDetailsListModel?.rating) !=
                              //         null
                              //     ? double.parse(
                              //         '${itineraryDetailScreenController.itineraryDetailsListModel?.rating}')
                              //     : 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              ignoreGestures: true,
                              itemCount: 5,
                              unratedColor: const Color(0xffE4E4E4),
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                double.parse(
                                    '${itineraryDetailScreenController.itineraryDetailsListModel?.rating}');
                              },
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                const SizedBox(height: 8),
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
      },
    );
  }

  getChannelId() async {
    Get.toNamed(MessageScreen.routeName, arguments: {
      "channelRef":
          itineraryDetailScreenController.itineraryDetailsListModel!.id,
      "specialistName": itineraryDetailScreenController
          .itineraryDetailsListModel!.specialistName,
      "specialistRef": itineraryDetailScreenController
          .itineraryDetailsListModel!.specialistRef
    });
  }

  String getItineraryDetailStatusIcon(int type) {
    if(type == ItineraryDetailStatus.ACCOMMODATION.type || type == ItineraryDetailStatus.CHECK_OUT.type) {
      return AppIcons.hotelIcon;
    }
    else if(type == ItineraryDetailStatus.RESTAURANT.type) {
      return AppIcons.restaurantIcon;
    }
    else if(type == ItineraryDetailStatus.ACTIVITY.type) {
      return AppIcons.activitiesIcon;
    }
    else if(type == ItineraryDetailStatus.FLIGHT.type) {
      return AppIcons.flightIcon;
    }
    else if(type == ItineraryDetailStatus.TRAIN.type) {
      return AppIcons.trainIcon;
    }
    else if(type == ItineraryDetailStatus.FERRY.type) {
      return AppIcons.ferryIcon;
    }
    else if(type == ItineraryDetailStatus.CAR.type) {
      return AppIcons.carIcon;
    }
    else if(type == ItineraryDetailStatus.NOTE.type) {
      return AppIcons.requestInfoIcon;
    }
    return "";
  }

  requestDialogBox() {
    return showCustomDialogItinerary(
      context: context,
      title: "Cancel Trip",
      content:
          "Are you sure you want to request a cancellation? Different reservations will have different policies. Inform your concierge through chat.",
      policyText: "Cancellation Policy",
      contentSize: 1,
      policyTextOnTap: () {
        Get.toNamed(CancellationPolicyScreen.routeName);
      },
      noonTap: () {
        Get.back();
      },
      yesonTap: () {
        setState(() {
          Get.back();

          itineraryDetailScreenController
              .itineraryCancellationRequest(itineraryRef: widget.data)
              .then((value) => getChannelId());
        });
      },
      color: AppColors.appBlueColor,
      okText: "Confirm & Chat",
      noText: "Cancel",
    );
  }

  cardNotAddedApproveDialogBox() {
    return showCustomDialogLogOut(
      context: context,
      title: "Are you sure you???re ready to approve?",
      content:
          "By clicking approve, you are letting your concierge know that you are happy with the itinerary provided and ready to pay the amount listed. If you don???t have a payment method added, please click Confirm & Add Card below. Your selected payment method will be charged \$${itineraryDetailScreenController.itineraryDetailsListModel?.price} today and your concierge will proceed with bookings.",
      contentSize: 1,
      noonTap: () {
        Get.back();
      },
      yesonTap: () {
        isFromItineraray = true;
        Get.back();
        Get.toNamed(AddCardScreen.routeName);
      },
      color: AppColors.appBlueColor,
      okText: "Confirm",
      noText: "Cancel",
    );
  }

  cardAddApproveDialogBox() {
    return showCustomDialogLogOut(
      context: context,
      title: "Are you sure you???re ready to approve?",
      content:
          "By clicking approve, you are letting your concierge know that you are happy with the itinerary provided and ready to pay the amount listed. Your selected payment method will be charged\$${itineraryDetailScreenController.itineraryDetailsListModel?.price} today and your concierge will proceed with bookings. Please click Confirm & Pay to continue.",
      contentSize: 1,
      noonTap: () {
        Get.back();
      },
      yesonTap: () {
        Get.back();
        Get.toNamed(SelectCardScreen.routeName);
      },
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
