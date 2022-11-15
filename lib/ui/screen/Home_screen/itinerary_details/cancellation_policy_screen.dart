import 'package:flutter/material.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/shared/appbar.dart';

class CancellationPolicyScreen extends StatefulWidget {
  static const String routeName = "/CancellationPolicyScreen";

  const CancellationPolicyScreen({Key? key}) : super(key: key);

  @override
  State<CancellationPolicyScreen> createState() =>
      _CancellationPolicyScreenState();
}

class _CancellationPolicyScreenState extends State<CancellationPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Cancellation Policy"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: const [
            Text(
              "If you request to cancel your travel plans within 24 hours after receiving and approving the itinerary, you won’t get charged a cancellation fee.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "If you request to cancel your planned, but unbooked travel plans after 24 hours, you are entitled to a \$9.99 cancellation fee.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "If you request to cancel your travel plans after they have been booked, then the cancellation fee will be 4% of the total trip cost.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
