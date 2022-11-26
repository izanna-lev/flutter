import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/custem_class/constant/app_images.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/home_controller.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/itinerary_detailes_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/view/Itinerary_request_form_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/view/home_screen.dart';

import '../../../../models/home/travels_plans_model.dart';
import '../../../../services/over&loding.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  HomeController homeController = Get.find<HomeController>();
  List<String> img = [
    'https://images.unsplash.com/photo-1513836279014-a89f7a76ae86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmF0dXJhbCUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    "https://images.unsplash.com/photo-1615391778726-4ef126b46850?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "https://images.allthingsnature.org/moss-on-stones-around-a-waterfall.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        builder: (HomeController homeController) {
          return PaginationView(
            key: homeController.pendingKey,
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            pullToRefresh: true,
            bottomLoader: const AppLoader(),
            itemBuilder: (BuildContext context,
                TravelPlansListModel travelPlansListModel, int index) {
              return homeScreenCommonCell(
                onTap: () {
                  Get.toNamed(
                    ItineraryDetailScreen.routeName,
                    arguments: homeController.travelPlansData[index].id,
                  );
                },
                image:
                    // imageUrl +
                    homeController.travelPlansData[index].image,
                day: homeController.travelPlansData[index].duration.toString(),
                please: homeController.travelPlansData[index].name,
                price: homeController.travelPlansData[index].price.toString(),
                pleaseDetail: homeController.travelPlansData[index].description,
              );
            },
            pageFetch: homeController.pendingData,
            onEmpty: homeController.travelPlansData.isEmpty
                ? Center(
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.asset(
                          AppImages.baseScreenPendingImage,
                          width: 198,
                          height: 200,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Request New Itinerary",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            "Click the icon to submit your itinerary request. Once received, you will be matched with a specialist to create your travel plans. They will appear here.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            homeController.pendingKey.currentState!.refresh();
                          },
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                        ),
                        const Text("No data found"),
                      ],
                    ),
                  ),
            onError: (error) {
              return const Center(
                child: Text("No comments here yet."),
              );
            },
            initialLoader: GetPlatform.isAndroid
                ? const Center(
                    child: AppLoader(),
                  )
                : const Center(
                    child: CupertinoActivityIndicator(),
                  ),
          );
        },
      ),
      floatingActionButton:
          // homeController.travelPlansData.isEmpty
          //     ?
          GetBuilder(
        builder: (HomeController homeController) {
          return homeController.travelPlansData.isEmpty
              ? GestureDetector(
                  onTap: () {
                    Get.toNamed(ItineraryFromScreen.routeName);
                  },
                  child: Image.asset(
                    AppIcons.floatingActionButtonIcon,
                    height: 50,
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }

  text({required String pleaseName}) {
    return Text(
      pleaseName,
      // maxLines: 2,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}
