import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/models/notifications_model/traveller_notification_model.dart';
import 'package:tralever_module/ui/screen/chats/view/message_screen.dart';
import 'package:tralever_module/ui/screen/notification/controller/Notification_controller.dart';

import '../../../../custem_class/constant/app_icons.dart';
import '../../../../custem_class/utils/globle.dart';
import '../../../../services/api_routes.dart';
import '../../Home_screen/itinerary_details/itinerary_detailes_screen.dart';

class NotificationView extends StatefulWidget {
  TravellerDetailsNotificationList travellerDetailsNotificationList;

  NotificationView({Key? key, required this.travellerDetailsNotificationList})
      : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationScreenController notificationScreenController =
      Get.find<NotificationScreenController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (NotificationScreenController notificationScreenController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.travellerDetailsNotificationList.seen == true;
                print(
                    ' widget.travellerDetailsNotificationList.type===>${widget.travellerDetailsNotificationList.type}');
                widget.travellerDetailsNotificationList.type == 1
                    ? widget.travellerDetailsNotificationList.type = 1
                    : widget.travellerDetailsNotificationList.type == 2
                        ? Get.toNamed(MessageScreen.routeName,
                            arguments: widget
                                .travellerDetailsNotificationList.sourceRef)
                        : widget.travellerDetailsNotificationList.type == 3
                            ? Get.toNamed(ItineraryDetailScreen.routeName,
                                arguments: widget
                                    .travellerDetailsNotificationList.sourceRef)
                            : widget.travellerDetailsNotificationList.type == 4
                                ? Get.toNamed(ItineraryDetailScreen.routeName,
                                    arguments: widget
                                        .travellerDetailsNotificationList
                                        .sourceRef)
                                : widget.travellerDetailsNotificationList.type ==
                                        5
                                    ? Get.toNamed(
                                        ItineraryDetailScreen.routeName,
                                        arguments: widget
                                            .travellerDetailsNotificationList
                                            .sourceRef)
                                    : widget.travellerDetailsNotificationList
                                                .type ==
                                            6
                                        ? Get.toNamed(
                                            ItineraryDetailScreen.routeName,
                                            arguments: widget
                                                .travellerDetailsNotificationList
                                                .sourceRef)
                                        : const SizedBox();
                notificationScreenController.update();
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: 41,
                              width: 41,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: widget.travellerDetailsNotificationList
                                            .type ==
                                        1
                                    ? const DecorationImage(
                                        image: AssetImage(
                                            AppIcons.adminNotificationIcon))
                                    : DecorationImage(
                                        image: NetworkImage(imageUrl +
                                                widget
                                                    .travellerDetailsNotificationList
                                                    .image
                                            // "https://images.allthingsnature.org/moss-on-stones-around-a-waterfall.jpg",
                                            ),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            widget.travellerDetailsNotificationList.seen == true
                                ? const SizedBox()
                                : Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.appBlueColor,
                                      // color: const Color(0xffC90E0E),
                                    ),
                                  ),
                          ]),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.travellerDetailsNotificationList.text,
                                // "Smit Dhola",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      displayChatTimeFromTimestamp(
                          widget.travellerDetailsNotificationList.createdOn),
                      // "2 May 2021, 2:30 PM",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
