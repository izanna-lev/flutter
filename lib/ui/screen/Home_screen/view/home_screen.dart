import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/Home_screen/view/current_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/view/past_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/view/pending_screen.dart';
import '../../../../custem_class/constant/app_colors.dart';
import '../../../../custem_class/constant/app_settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(vsync: this, length: 3, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        bottom: BorderSide(color: Color(0xffd4d4d4), width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TabBar(
              controller: controller,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.shade700,
              indicatorColor: AppColors.appBlueColor,
              labelStyle: const TextStyle(
                fontFamily: kAppFont,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(
                  child: Text("Current"),
                ),
                Tab(
                  child: Text("Pending"),
                ),
                Tab(
                  child: Text("Past"),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: const [
              CurrentScreen(),
              PendingScreen(),
              PastScreen(),
            ],
          ),
        ),
      ],
    );
  }
}

/// Home Screen Common cell
homeScreenCommonCell({
  required void Function() onTap,
  required String image,
  required String day,
  required String please,
  required String price,
  required String pleaseDetail,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0.0, 0.5)),
            ],
            image: DecorationImage(
              image: NetworkImage(
                //"https://images.allthingsnature.org/moss-on-stones-around-a-waterfall.jpg"
                imageUrl + image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 8.0,
                      sigmaY: 8.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        "$day Days",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              please,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 50),
                          Text(
                            "\$$price",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Text(pleaseDetail),
                          ),
                          const SizedBox(width: 100),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 25),
    ],
  );
}
