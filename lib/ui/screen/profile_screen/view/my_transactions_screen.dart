import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/my_transations_controller.dart';
import 'package:tralever_module/ui/shared/material_button.dart';

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
                    filter();
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
              return Column(
                children: [
                  myTransactionsController
                              .transactionListData[index].transactionType ==
                          1
                      ? paidSell(
                          countryName: myTransactionsController
                              .transactionListData[index].name,
                          cardNumber: myTransactionsController
                              .transactionListData[index].lastDigitsCard,
                          date: myTransactionsController
                              .transactionListData[index].createdOn,
                          // "25-jan-2022",
                          price:
                              "\$${myTransactionsController.transactionListData[index].price.toString()}")
                      : cancelSell(
                          countryName: myTransactionsController
                              .transactionListData[index].name,
                          cardNumber: myTransactionsController
                              .transactionListData[index].lastDigitsCard,
                          date: myTransactionsController
                              .transactionListData[index].createdOn,
                          //"25-jan-2022",
                          price:
                              "\$${myTransactionsController.transactionListData[index].price.toString()}"),
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

  filter() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: 230,
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
                    Row(
                      children: [
                        const Text(
                          "From",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: filterTextField(
                            controller:
                                myTransactionsController.fromDateController,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "To",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: filterTextField(
                            controller:
                                myTransactionsController.toDateController,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const Spacer(),
                    materialButton(
                      onTap: () {
                        Get.back();
                        myTransactionsController.transactionsData(
                          fromDate:
                              myTransactionsController.fromDateController.text,
                          toDate:
                              myTransactionsController.toDateController.text,
                        );
                      },
                      text: "Apply Filter",
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          );
        });
  }

  filterTextField({
    required TextEditingController controller,
    required TextInputAction textInputAction,
  }) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: TextInputType.number,
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
