import 'package:flutter/material.dart';
import 'package:get/get.dart';

commonAppbar({required String titleText}) {
  return AppBar(
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
    title: Text(
      titleText,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
