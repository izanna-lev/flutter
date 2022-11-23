import 'package:get/get.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/car/car_ticket_deatils_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/ferrry/ferry_ticket_deatils_screen.dart';
import 'package:tralever_module/ui/screen/Home_screen/itinerary_details/train/train_ticket_deatils_screen.dart';
import 'package:tralever_module/ui/screen/chats/view/allmessages.dart';
import 'package:tralever_module/ui/screen/login/view/login_screen.dart';
import 'package:tralever_module/ui/screen/login/view/onboarding_screen.dart';
import 'package:tralever_module/ui/screen/notification/view/notification_screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/activity_details_screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/activity_map_details_screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/additional_information.dart';
import '../../ui/screen/Home_screen/itinerary_details/cancellation_policy_screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/car/car_ticket_preview_screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/ferrry/ferry_ticket_preview_screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/hotel_rservations_screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/itinerary_detailes_screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/rate_your_experience.dart';
import '../../ui/screen/Home_screen/itinerary_details/required_information_Screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/restaurant_reservations_screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/flight/flight_ticket_preview_screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/flight/flight_tickets_details_screen.dart';
import '../../ui/screen/Home_screen/itinerary_details/train/train_ticket_preview_screen.dart';
import '../../ui/screen/Home_screen/view/Itinerary_request_form_screen.dart';
import '../../ui/screen/Home_screen/view/home_screen.dart';
import '../../ui/screen/base_screen/view/base_screen.dart';
import '../../ui/screen/chats/view/chat_room_screen.dart';
import '../../ui/screen/chats/view/chats_screen.dart';
import '../../ui/screen/chats/view/message_screen.dart';
import '../../ui/screen/chats/view/report_screen.dart';
import '../../ui/screen/login/view/splash_screen.dart';
import '../../ui/screen/profile_screen/view/add_card_screen.dart';
import '../../ui/screen/profile_screen/view/cars_added_successfully.dart';
import '../../ui/screen/profile_screen/view/manage_payment_screen.dart';
import '../../ui/screen/profile_screen/view/my_transactions_screen.dart';
import '../../ui/screen/profile_screen/view/profile_screen.dart';
import '../../ui/screen/settings_screen/view/about_us_screen.dart';
import '../../ui/screen/settings_screen/view/contact_ admin_screen.dart';
import '../../ui/screen/settings_screen/view/faq_screen.dart';
import '../../ui/screen/settings_screen/view/settings_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
  GetPage(
      name: OnBoardingScreen.routeName, page: () => const OnBoardingScreen()),
  GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
  GetPage(name: BaseScreen.routeName, page: () => const BaseScreen()),
  GetPage(name: ProfileScreen.routeName, page: () => const ProfileScreen()),
  GetPage(name: SettingScreen.routeName, page: () => const SettingScreen()),
  GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
  GetPage(name: ChatsScreen.routeName, page: () => const ChatsScreen()),
  GetPage(
      name: NotificationScreen.routeName,
      page: () => const NotificationScreen()),
  GetPage(
      name: ItineraryFromScreen.routeName,
      page: () => const ItineraryFromScreen()),
  GetPage(
      name: ItineraryDetailScreen.routeName,
      page: () => ItineraryDetailScreen()),
  GetPage(
      name: AdditionalInformationScreen.routeName,
      page: () => const AdditionalInformationScreen()),
  GetPage(
      name: ContactAdminScreen.routeName,
      page: () => const ContactAdminScreen()),
  GetPage(name: AboutUsScreen.routeName, page: () => const AboutUsScreen()),
  GetPage(name: AddCardScreen.routeName, page: () => const AddCardScreen()),
  GetPage(
      name: CardAddedSuccessfully.routeName,
      page: () => const CardAddedSuccessfully()),
  GetPage(
      name: CancellationPolicyScreen.routeName,
      page: () => const CancellationPolicyScreen()),
  GetPage(
      name: ManagePaymentScreen.routeName,
      page: () => const ManagePaymentScreen()),
  GetPage(
      name: RateYourExperience.routeName,
      page: () => const RateYourExperience()),
  GetPage(
      name: HotelReservationsScreen.routeName,
      page: () => const HotelReservationsScreen()),
  GetPage(
      name: RestaurantReservationsScreen.routeName,
      page: () => const RestaurantReservationsScreen()),
  GetPage(
      name: FlightTicketsDetailsScreen.routeName,
      page: () => const FlightTicketsDetailsScreen()),
  GetPage(
      name: RequiredInformationScreen.routeName,
      page: () => const RequiredInformationScreen()),
  GetPage(
      name: FlightTicketPreviewScreen.routeName,
      page: () => FlightTicketPreviewScreen()),
  GetPage(
      name: ActivityDetailsScreen.routeName,
      page: () => const ActivityDetailsScreen()),
  GetPage(
      name: ActivityMapDetails.routeName,
      page: () => const ActivityMapDetails()),
  GetPage(name: ChatRoomScreen.routeName, page: () => const ChatRoomScreen()),
  GetPage(name: ReportScreen.routeName, page: () => const ReportScreen()),
  GetPage(name: FAQScreen.routeName, page: () => const FAQScreen()),
  GetPage(
      name: MyTransactionScreen.routeName,
      page: () => const MyTransactionScreen()),
  GetPage(
      name: TrainTicketDetailsScreen.routeName,
      page: () => const TrainTicketDetailsScreen()),
  GetPage(
      name: FerryTicketDetailsScreen.routeName,
      page: () => const FerryTicketDetailsScreen()),
  GetPage(
      name: CarTicketDetailsScreen.routeName,
      page: () => const CarTicketDetailsScreen()),
  GetPage(
      name: FerryTicketPreviewScreen.routeName,
      page: () => FerryTicketPreviewScreen()),
  GetPage(
      name: TrainTicketPreviewScreen.routeName,
      page: () => const TrainTicketPreviewScreen()),
  GetPage(
      name: CarTicketPreviewScreen.routeName,
      page: () => const CarTicketPreviewScreen()),

  GetPage(name: MessageScreen.routeName, page: () => MessageScreen()),

  /// GetPage(name: AllMessages.routeName, page: () => AllMessages()),
];
