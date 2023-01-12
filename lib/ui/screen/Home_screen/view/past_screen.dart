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

class PastScreen extends StatefulWidget {
  const PastScreen({Key? key}) : super(key: key);

  State<PastScreen> createState() => _PastScreenState();
}

class _PastScreenState extends State<PastScreen> {
  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginationView(
        key: homeController.pastKey,
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
                arguments: homeController.pastPlansData[index].id,

                /// arguments: homeController.travelPlansData[index].id,
              );
            },
            image:
            // imageUrl +
            homeController.pastPlansData[index].image,
            day: homeController.pastPlansData[index].duration.toString(),
            please: homeController.pastPlansData[index].name,
            price: homeController.pastPlansData[index].price.toString(),
            pleaseDetail: homeController.pastPlansData[index].description,
          );
        },
        pageFetch: homeController.pastData,
        onEmpty: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  homeController.pastKey.currentState!.refresh();
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
