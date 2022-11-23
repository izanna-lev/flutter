///development server
const String url = "http://44.209.25.93:3000/api/";
const String imageUrl =
    "https://app-onsite.s3.amazonaws.com/development/images/small/";
const String socketBaseUrl = "http://44.209.25.93:3000";

///ROWND APP KEY
const String rowndAppKey = "d432a653-54bc-4c1d-a8c8-bf975187a5f8";

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
  static const String notificationList = "${url}notification/userSelectList";
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

  ///* Traveller
  static const String rowndSignIn = "${url}traveller/signin";
}

const resourceAPIPaginationStart = 1;
const resourceAPIPaginationLimit = 30;

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
