import 'package:get/get.dart';

import '../../../../custem_class/utils/globle.dart';

class BaseScreenController extends GetxController {
  int _selectedTab = 0;
  int get selectedTab => _selectedTab;
  set selectedTab(int value) {
    _selectedTab = value;
    Future.delayed(Duration.zero, () {
      update();
    });
  }

  int _current = initialTab;
  int get currentTab => _current;
  set currentTab(int value) {
    _current = value;
    Future.delayed(Duration.zero, () {
      update();
    });
  }

  resetInitialTab() {
    currentTab = 0;
  }
}
