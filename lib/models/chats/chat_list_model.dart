import 'dart:convert';

import '../home/itinerary_details_model.dart';

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
    required this.hasMore,
  });

  int code;
  String message;
  List<ChatListModel> data;
  int page;
  int limit;
  int size;
  bool hasMore;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        code: json["code"],
        message: json["message"],
        data: List<ChatListModel>.from(
            json["data"].map((x) => ChatListModel.fromJson(x))),
        page: json["page"],
        limit: json["limit"],
        size: json["size"],
        hasMore: json["hasMore"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "page": page,
        "limit": limit,
        "size": size,
        "hasMore": hasMore,
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
  Location location;
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
        location: Location.fromJson(json["location"] ?? {}),
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
        "location": location.toJson(),
        "unseenMessages": unseenMessages,
      };
}

class Location {
  Location({
    required this.location,
    required this.type,
    required this.coordinates,
  });

  String location;
  String type;
  List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        location: json["location"],
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

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
  });

  String id;
  String userRef;
  String channelRef;
  String message;
  int messageType;
  bool deleted;
  String createdOn;
  String updatedOn;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"] ?? "",
        userRef: json["userRef"] ?? "",
        channelRef: json["channelRef"] ?? "",
        message: json["message"] ?? "",
        messageType: json["messageType"] ?? 0,
        deleted: json["deleted"] ?? false,
        createdOn: json["createdOn"] ?? "",
        updatedOn: json["updatedOn"] ?? "",
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
  Itinerary itinerary;

  factory MessageDataResponse.fromJson(Map<String, dynamic> json) =>
      MessageDataResponse(
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
        itinerary: Itinerary.fromJson(json["itinerary"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
        "itinerary": itinerary.toJson(),
      };
}

class SuccessResponse {
  SuccessResponse({
    required this.code,
    required this.message,
  });

  int code;
  String message;

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      SuccessResponse(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
      );

  Map<dynamic, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
