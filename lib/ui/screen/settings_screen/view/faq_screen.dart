import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';

import '../../../../custem_class/constant/app_settings.dart';
import '../../../../custem_class/utils/size_config.dart';
import '../../../../models/settings/faq_model.dart';
import '../controller/faq_controller.dart';

class FAQScreen extends StatefulWidget {
  static const String routeName = "/FAQScreen";

  const FAQScreen({Key? key}) : super(key: key);

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final FaqController faqController = Get.put(FaqController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "FAQs".tr,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder(
            builder: (FaqController controller) => PaginationView(
              pullToRefresh: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder:
                  (BuildContext context, ListElement listElement, int index) {
                return faqsBody(listElement, index);
              },
              pageFetch: faqController.fetchFaqs,
              onError: (error) {
                debugPrint("Error $error");
                return Center(child: Text(error));
              },
              onEmpty: Center(
                child: Text("No Data Found".tr),
              ),
              initialLoader: GetPlatform.isAndroid
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Center(child: CupertinoActivityIndicator()),
            ),
          ),
        ));
  }

  faqsBody(ListElement listElement, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            textColor: Colors.black,
            iconColor: Colors.black,
            collapsedIconColor: Colors.black,
            expandedAlignment: Alignment.topLeft,
            tilePadding: const EdgeInsets.symmetric(horizontal: 1),
            title: Text(
              listElement.question.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: kAppFont,
                fontSize: getHeight(16),
              ),
            ),
            children: [
              Text(
                listElement.answer.toString(),
                style: TextStyle(
                  fontSize: getWidth(15),
                  height: 1.3,
                  fontFamily: kAppFont,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xffD2D6DC),
          thickness: 1,
          height: 5,
        ),
      ],
    );
  }
}

buildWidget(String image, double height, double width) {
  return SizedBox(
    height: getHeight(height),
    width: getWidth(width),
    child: Image.asset(
      image,
      fit: BoxFit.fill,
    ),
  );
}
