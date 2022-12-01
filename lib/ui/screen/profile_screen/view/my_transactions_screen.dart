import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/constant/app_functions.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/add_card_controller.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/my_transations_controller.dart';
import 'package:tralever_module/ui/screen/profile_screen/view/to_date_picker.dart';
import 'package:tralever_module/ui/shared/material_button.dart';

import 'from_date_picker.dart';

class MyTransactionScreen extends StatefulWidget {
  static const String routeName = "/MyTransactionScreen";

  const MyTransactionScreen({Key? key}) : super(key: key);

  @override
  State<MyTransactionScreen> createState() => _MyTransactionScreenState();
}

class _MyTransactionScreenState extends State<MyTransactionScreen> {
  MyTransactionsController myTransactionsController =
      Get.find<MyTransactionsController>();

  @override
  void initState() {
    myTransactionsController.transactionsData(transactionsType: 1);
    myTransactionsController.transactionsData(transactionsType: 2);
    super.initState();
  }

  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (MyTransactionsController myTransactionsController) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24,
              ),
            ),
            title: const Text(
              "My Transactions",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    filter(myTransactionsController);
                  },
                  child: Image.asset(
                    AppIcons.filterIcon,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: myTransactionsController.transactionListData.length,
            itemBuilder: (BuildContext context, int index) {
              return
                  // myTransactionsController.transactionListData.isEmpty
                  //   ? const Center(
                  //       child: Text(
                  //         "NO Data Found",
                  //         style: TextStyle(color: Colors.pink),
                  //       ),
                  //     )
                  //   :
                  Column(
                children: [
                  myTransactionsController
                              .transactionListData[index].transactionType ==
                          1
                      ? paidSell(
                          countryName: myTransactionsController
                              .transactionListData[index].name,
                          cardNumber:
                              "XXX-XXX-XXX-${myTransactionsController.transactionListData[index].lastDigitsCard}",
                          date: myTransactionsDate(myTransactionsController
                              .transactionListData[index].createdOn),
                          price: myTransactionsController
                              .transactionListData[index].price
                              .toString(),
                        )
                      : cancelSell(
                          countryName: myTransactionsController
                              .transactionListData[index].name,
                          cardNumber:
                              "XXX-XXX-XXX-${myTransactionsController.transactionListData[index].lastDigitsCard}",
                          date: myTransactionsDate(myTransactionsController
                              .transactionListData[index].createdOn),
                          price: myTransactionsController
                              .transactionListData[index].price
                              .toString(),
                        ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  paidSell({
    required String countryName,
    required String cardNumber,
    required String date,
    required String price,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      countryName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      cardNumber,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [
                  Text(
                    "\$$price",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.appBlueColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffD6f2fa),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Text(
                        "Paid",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 1),
        const SizedBox(height: 10),
      ],
    );
  }

  cancelSell({
    required String countryName,
    required String cardNumber,
    required String date,
    required String price,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      countryName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      cardNumber,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$$price",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffEB0000),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffFbd3d4),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Text(
                        "Cancellation Charges",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 1),
        const SizedBox(height: 10),
      ],
    );
  }

  filter(MyTransactionsController myTransactionsController) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Form(
            key: myTransactionsController.filterKey,
            child: Column(
              children: [
                const Spacer(),
                Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 220,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.black54,
                                  )),
                              const SizedBox(width: 50),
                              const Text(
                                "Transactions",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Row(
                              children: const [
                                Text(
                                  "From",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: FormDemoDatePiker(),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "To",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: ToDemoDatePiker(),
                                ),
                                SizedBox(width: 8),
                              ],
                            ),
                          ),
                          //const Spacer(),
                          materialButton(
                            onTap: () {
                              if (myTransactionsController
                                  .filterKey.currentState!
                                  .validate()) {
                                disposeKeyboard();
                                Get.back();
                                myTransactionsController.transactionsData(
                                  fromDate: myTransactionsController
                                      .fromDateController.text,
                                  toDate: myTransactionsController
                                      .toDateController.text,
                                );
                              }
                            },
                            text: "Apply Filter",
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        });
  }

  filterTextField({
    required TextEditingController controller,
    required TextInputAction textInputAction,
    required String validatorText,
  }) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "DD-MM-YYYY",
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
