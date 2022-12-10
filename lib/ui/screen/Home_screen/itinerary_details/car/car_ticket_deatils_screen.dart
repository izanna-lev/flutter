import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/car/car_user_details.dart';

import '../../../../../custem_class/constant/app_colors.dart';
import '../../../../../custem_class/constant/app_settings.dart';
import '../../../../shared/appbar.dart';
import 'car_details.dart';

class CarTicketDetailsScreen extends StatefulWidget {
  static const String routeName = "/CarTicketDetailsScreen";

  CarTicketDetailsScreen({Key? key}) : super(key: key);
  var data = Get.arguments;

  @override
  State<CarTicketDetailsScreen> createState() => _CarTicketDetailsScreenState();
}

class _CarTicketDetailsScreenState extends State<CarTicketDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    widget.data;
    print('CAR_TICKET_DATA==>${widget.data}');
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      child: Text("Car Details"),
                    ),
                    Tab(
                      child: Text("User Details"),
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
                  CarDetails(index: widget.data),
                  CarUserDetailsScreen(index: widget.data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
