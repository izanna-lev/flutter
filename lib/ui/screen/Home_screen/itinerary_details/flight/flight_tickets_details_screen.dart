import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/flight/flight_user_details.dart';
import 'package:tralever_module/ui/shared/appbar.dart';

import '../../../../../custem_class/constant/app_colors.dart';
import '../../../../../custem_class/constant/app_settings.dart';
import 'flight_details.dart';

class FlightTicketsDetailsScreen extends StatefulWidget {
  static const String routeName = "/TicketsDetailsScreen";

  FlightTicketsDetailsScreen({Key? key}) : super(key: key);
  var index = Get.arguments;

  @override
  State<FlightTicketsDetailsScreen> createState() =>
      _FlightTicketsDetailsScreenState();
}

class _FlightTicketsDetailsScreenState extends State<FlightTicketsDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  @override
  void initState() {
    widget.index;
    print('FLIGHT_DATA===>${widget.index}');
    controller = TabController(vsync: this, length: 2);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Tickets Details"),
      body: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Color(0xffd4d4d4), width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TabBar(
                controller: controller,
                indicatorColor: AppColors.appBlueColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                labelColor: Colors.grey.shade700,
                unselectedLabelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontFamily: kAppFont,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(
                    child: Text("Flight Details"),
                  ),
                  Tab(
                    child: Text("Traveler Details"),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                FlightDetail(index: widget.index),
                FlightUserDetails(
                  index: widget.index,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
