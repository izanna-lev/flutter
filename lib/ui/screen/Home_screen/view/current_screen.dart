import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';

import '../../../../custem_class/constant/app_icons.dart';
import '../../../../models/home/travels_plans_model.dart';
import '../../../../services/over&loding.dart';
import '../controller/home_controller.dart';
import '../itinerary_details/itinerary_detailes_screen.dart';
import 'Itinerary_request_form_screen.dart';
import 'home_screen.dart';

class CurrentScreen extends StatefulWidget {
  const CurrentScreen({Key? key}) : super(key: key);

  @override
  State<CurrentScreen> createState() => _CurrentScreenState();
}

class _CurrentScreenState extends State<CurrentScreen> {
  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginationView(
        key: homeController.currentKey,
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
                arguments: homeController.currentPlansData[index].id,
              );
            },
            image:
            // imageUrl +
            homeController.currentPlansData[index].image,
            day: homeController.currentPlansData[index].duration.toString(),
            please: homeController.currentPlansData[index].name,
            price: homeController.currentPlansData[index].price.toString(),
            pleaseDetail: homeController.currentPlansData[index].description,
          );
        },
        pageFetch: homeController.currentData,
        onEmpty: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  homeController.currentKey.currentState!.refresh();
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
      )
    );
  }
}
