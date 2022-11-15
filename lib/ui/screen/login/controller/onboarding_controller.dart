import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  int _index = 0;

  int get index => _index;

  set index(int value) {
    _index = value;
    Future.delayed(Duration.zero, () {
      update();
    });
  }
}
