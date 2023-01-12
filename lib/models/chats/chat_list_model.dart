import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  ChatModel({
    required this.code,
    required this.message,
    required this.data,
    required this.page,
    required this.limit,
    required this.size,
    required this.totalUnseenChats,
  });

  int code;
  String message;
  List<ChatListModel> data;
  int page;
  int limit;
  int size;
  int totalUnseenChats;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        code: json["code"],
        message: json["message"],
        data: List<ChatListModel>.from(
            json["data"].map((x) => ChatListModel.fromJson(x))),
        page: json["page"],
        limit: json["limit"],
        size: json["size"],
        totalUnseenChats: json["totalUnseenChats"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "page": page,
        "limit": limit,
        "size": size,
        "totalUnseenChats": totalUnseenChats,
      };
}

class ChatListModel {
  ChatListModel({
    required this.id,
    required this.channelRef,
    required this.specialistRef,
    required this.specialistName,
    required this.message,
    required this.itineraryStatus,
    required this.fromDate,
    required this.toDate,
    required this.image,
    required this.location,
    required this.unseenMessages,
  });

  String id;
  String channelRef;
  String specialistRef;
  String specialistName;
  Message message;
  int itineraryStatus;
  String fromDate;
  String toDate;
  String image;
  String location;
  bool unseenMessages;

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        id: json["_id"] ?? "",
        channelRef: json["channelRef"] ?? "",
        specialistRef: json["specialistRef"] ?? "",
        specialistName: json["specialistName"] ?? "",
        message: Message.fromJson(json["message"] ?? {}),
        itineraryStatus: json["itineraryStatus"] ?? 0,
        fromDate: json["fromDate"] ?? "",
        toDate: json["toDate"] ?? "",
        image: json["image"] ?? "",
        location: json["location"] ?? "",
        unseenMessages: json["unseenMessages"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "channelRef": channelRef,
        "specialistRef": specialistRef,
        "specialistName": specialistName,
        "message": message.toJson(),
        "itineraryStatus": itineraryStatus,
        "fromDate": fromDate,
        "toDate": toDate,
        "image": image,
        "location": location,
        "unseenMessages": unseenMessages,
      };
}

/*class Location {
  Location({
    required this.location,
    required this.type,
    required this.coordinates,
  });

  String location;
  String type;
  List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        location: json["location"] ?? "",
        type: json["type"] ?? "",
        coordinates: (json["coordinates"] == null)
            ? []
            : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}*/

class Message {
  Message({
    required this.id,
    required this.userRef,
    required this.channelRef,
    required this.message,
    required this.messageType,
    required this.deleted,
    required this.createdOn,
    required this.updatedOn,
    required this.specialist,
    required this.admin,
  });

  String id;
  String userRef;
  String channelRef;
  String message;
  int messageType;
  bool deleted;
  String createdOn;
  String updatedOn;
  SpecialistChatModel specialist;
  SpecialistChatModel admin;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"] ?? "",
        userRef: json["userRef"] ?? json["userId"] ?? "",
        channelRef: json["channelRef"] ?? "",
        message: json["message"] ?? "",
        messageType: json["messageType"] ?? 0,
        deleted: json["deleted"] ?? false,
        createdOn: json["createdOn"] ?? "",
        updatedOn: json["updatedOn"] ?? "",
        specialist: SpecialistChatModel.fromJson(json["specialist"] ?? {}),
        admin: SpecialistChatModel.fromJson(json["admin"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userRef": userRef,
        "channelRef": channelRef,
        "message": message,
        "messageType": messageType,
        "deleted": deleted,
        "createdOn": createdOn,
        "updatedOn": updatedOn,
        "specialist": specialist.toJson(),
        "admin": admin.toJson(),
      };
}

class SpecialistChatModel {
  SpecialistChatModel({
    required this.name,
    required this.image,
  });

  String name;
  String image;

  factory SpecialistChatModel.fromJson(Map<String, dynamic> json) => SpecialistChatModel(
    name: json["name"] ?? "",
    image: json["image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}

class MessageListResponse {
  MessageListResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  MessageDataResponse data;

  factory MessageListResponse.fromJson(Map<String, dynamic> json) =>
      MessageListResponse(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: MessageDataResponse.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class MessageDataResponse {
  MessageDataResponse({
    required this.messages,
    required this.itinerary,
  });

  List<Message> messages;
  ItineraryMessageModel itinerary;

  factory MessageDataResponse.fromJson(Map<String, dynamic> json) =>
      MessageDataResponse(
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
        itinerary: ItineraryMessageModel.fromJson(json["itinerary"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
        "itinerary": itinerary.toJson(),
      };
}

class ItineraryMessageModel {
  ItineraryMessageModel({
    required this.id,
    required this.location,
    required this.itineraryStatus,
    required this.image,
    required this.fromDate,
    required this.toDate,
    required this.otherUserName,
  });

  String id;
  String location;
  int itineraryStatus;
  String image;
  String fromDate;
  String toDate;
  String otherUserName;

  factory ItineraryMessageModel.fromJson(Map<String, dynamic> json) =>
      ItineraryMessageModel(
        id: json["_id"] ?? "",
        location: json["location"] ?? "",
        itineraryStatus: json["itineraryStatus"] ?? 0,
        image: json["image"] ?? "",
        fromDate: json["fromDate"] ?? "",
        toDate: json["toDate"] ?? "",
        otherUserName: json["otherUserName"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "location": location,
        "itineraryStatus": itineraryStatus,
        "image": image,
        "fromDate": fromDate,
        "toDate": toDate,
        "otherUserName": otherUserName,
      };
}

class SuccessResponse {
  SuccessResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  int data;

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      SuccessResponse(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: json["data"] ?? 0,
      );

  Map<dynamic, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
      };
}
