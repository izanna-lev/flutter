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

  int _index = 0;

  int get index => _index;

  set index(int value) {
    _index = value;
    update();
  }

  int _chatUnreadCount = 0;
  int get chatUnreadCount => _chatUnreadCount;
  set chatUnreadCount(int value) {
    _chatUnreadCount = value;
    update();
  }

  bool _notiUnreadCount = false;

  bool get notiUnreadCount => _notiUnreadCount;

  set notiUnreadCount(bool value) {
    _notiUnreadCount = value;
    update();
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
