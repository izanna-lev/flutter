import 'package:tralever_module/custem_class/utils/globle.dart';

///development server
// const String url = "https://developmentapi.onsiteplanning.com/api/";
// const String imageUrl =
//     "https://app-onsite.s3.amazonaws.com/development/images/small/";
// const String socketBaseUrl = "https://developmentapi.onsiteplanning.com";
//============================================================================
///Staging server
// const String url = "http://44.208.65.177:3000/api/";
// const String socketBaseUrl = "http://44.208.65.177:3000";

// const String url = "https://api.onsiteplanning.com/api/";
// const String socketBaseUrl = "https://api.onsiteplanning.com";

//Latest one
// const String url = "https://stageapi.onsiteplanning.com/api/";
// const String socketBaseUrl = "https://stageapi.onsiteplanning.com";
// const String imageUrl =
//     "https://app-onsite.s3.amazonaws.com/staging/images/small/";
//============================================================================
/// Production
const String url = "https://api.onsiteplanning.com/api/";
const String socketBaseUrl = "https://api.onsiteplanning.com";
const String imageUrl =
    "https://app-onsite.s3.amazonaws.com/production/images/small/";
//============================================================================
///ROWND APP KEY
const String rowndAppKey = "d432a653-54bc-4c1d-a8c8-bf975187a5f8";
// const String rowndAppKey = "d7e2c6ec-99aa-4614-ad02-41baaa742fc6";
//============================================================================
///STRIPE KEY
///Test Key
// const String STRIPE_KEY = "Bearer sk_test_51JF4vAG0ZIlqut04vVg4LRJ7MyjmN7CqaQdywJjXZXbLY6CtlZuZ1TJujDXMwtC4AELBySa3yyMC5R2yJdo4k8r600imjRSehB";
///Live Key
const String STRIPE_KEY = "Bearer pk_live_51JF4vAG0ZIlqut04RBL90oqDBm7eO1hfZK8BNH2D42ovR21GhNsSv5zh4Kx573QlGPgHirytyv5TQ2mGdqvfjQ9F00B1BW1NMH";

SETTING_SCREEN SEETING_SCREEN_TYPE = SETTING_SCREEN.ABOUT;

class APIRoutes {
  static const String login = "${url}user/login";
  static const String signup = "${url}user/signup";
  static const String appDetailList = "${url}appdetail/list";
  static const String faqsList = "${url}faq/list";
  static const String contactAdmin = "${url}user/contactAdmin";
  static const String userDelete = "${url}user/deleteAccount";
  static const String editProfile = "${url}user/update";
  static const String homeList = "${url}home/list";
  static const String itineraryAdd = "${url}itinerary/add";
  static const String itineraryRequestAdd = "${url}itineraryRequest/add";
  static const String homeDetails = "${url}home/details";
  static const String notificationUserSelectList =
      "${url}notification/userSelectList";
  static const String ratingAdd = "${url}rating/add";
  static const String cardAdd = "${url}card/add";
  static const String cardList = "${url}card/list";
  static const String cardRemove = "${url}card/remove";
  static const String userProfile = "${url}user/details";
  static const String transactionList = "${url}transaction/list";
  static const String travellerChatList = "${url}traveller/chatList";
  static const String travellerMessageList = "${url}traveller/messageList";
  static const String travellerChatImage = "${url}traveller/chatImage";
  static const String travellerGetChannel = "${url}traveller/getChannel";
  static const String travellerActions = "${url}traveller/actions";
  static const String travellerUnread = "${url}traveller/unread";
  static const String itineraryApprove = "${url}itinerary/approve";
  static const String reportAdd = "${url}report/add";
  static const String itineraryCancellationRequest =
      "${url}itinerary/cancellationRequest";

  ///* Traveller
  static const String rowndSignIn = "${url}traveller/signin";
  static const String travellerNotificationList =
      "${url}notification/travellerList";
  static const String travellerNotificationSeen = "${url}notification/seen";
}

const resourceAPIPaginationStart = 1;
const resourceAPIPaginationLimit = 30;
const travellerNotificationAPIPaginationStart = 1;
const travellerNotificationAPIPaginationLimit = 30;

enum ContentType { jsonType }

String contentType(ContentType contentType) {
  String type;
  switch (contentType) {
    case ContentType.jsonType:
      type = "application/json";
      break;
  }
  return type;
}
