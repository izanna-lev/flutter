import 'package:flutter/material.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/train/train_details.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/train/train_user_details.dart';

import '../../../../../custem_class/constant/app_colors.dart';
import '../../../../../custem_class/constant/app_settings.dart';
import '../../../../shared/appbar.dart';

class TrainTicketDetailsScreen extends StatefulWidget {
  static const String routeName = "/TrainTicketDetailsScreen";

  const TrainTicketDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TrainTicketDetailsScreen> createState() =>
      _TrainTicketDetailsScreenState();
}

class _TrainTicketDetailsScreenState extends State<TrainTicketDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
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
                    child: Text("Train Details"),
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
              children: const [
                TrainDetails(),
                TrainUserDetailsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
