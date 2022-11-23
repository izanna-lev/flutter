import 'package:get/get.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/home_controller.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_request_form_controller.dart';
import 'package:tralever_module/ui/screen/base_screen/controller/base_screen_controller.dart';
import 'package:tralever_module/ui/screen/login/controller/login_controller.dart';
import 'package:tralever_module/ui/screen/notification/controller/Notification_controller.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/my_transations_controller.dart';
import 'package:tralever_module/ui/screen/profile_screen/controller/profile_controller.dart';
import 'package:tralever_module/ui/screen/settings_screen/controller/contactadmin_controller.dart';

import '../../ui/screen/Home_screen/controller/itinerary_detaile_screen _controller.dart';
import '../../ui/screen/chats/controller/chat_screen_controller.dart';
import '../../ui/screen/login/controller/onboarding_controller.dart';
import '../../ui/screen/profile_screen/controller/add_card_controller.dart';
import '../../ui/screen/settings_screen/controller/about_screen_controller.dart';
import '../../ui/screen/settings_screen/controller/faq_controller.dart';
import '../../ui/shared/image_picker_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController(),
        fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<BaseScreenController>(() => BaseScreenController(),
        fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<NotificationScreenController>(
        () => NotificationScreenController(),
        fenix: true);
    Get.lazyPut<ItineraryRequestFormController>(
        () => ItineraryRequestFormController(),
        fenix: true);
    Get.lazyPut<ContactAdminController>(() => ContactAdminController(),
        fenix: true);
    Get.lazyPut<AboutScreenController>(() => AboutScreenController(),
        fenix: true);
    Get.lazyPut<FaqController>(() => FaqController(), fenix: true);
    Get.lazyPut<AddCardController>(() => AddCardController(), fenix: true);
    Get.lazyPut<ItineraryDetailScreenController>(
        () => ItineraryDetailScreenController(),
        fenix: true);
    Get.lazyPut<ImagePickerController>(() => ImagePickerController(),
        fenix: true);
    Get.lazyPut<ChatScreenController>(() => ChatScreenController(),
        fenix: true);
    Get.lazyPut<ProfilerController>(() => ProfilerController(), fenix: true);
    Get.lazyPut<MyTransactionsController>(() => MyTransactionsController(),
        fenix: true);

    ///Get.lazyPut<AllChatController>(() => AllChatController(), fenix: true);
  }
}
