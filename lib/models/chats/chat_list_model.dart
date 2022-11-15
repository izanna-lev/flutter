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
    required this.itineraryStatus,
    required this.fromDate,
    //required this.toDate,
    required this.image,
    required this.location,
    required this.unseenMessages,
  });

  String id;
  String channelRef;
  int itineraryStatus;
  String fromDate;
  // DateTime toDate;
  String image;
  Location location;
  bool unseenMessages;

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        id: json["_id"] ?? "",
        channelRef: json["channelRef"] ?? "",
        itineraryStatus: json["itineraryStatus"] ?? 0,
        fromDate: json["fromDate"] ?? "",
        //toDate: DateTime.parse(json["toDate"]),
        image: json["image"] ?? "",
        location: Location.fromJson(json["location"]),
        unseenMessages: json["unseenMessages"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "channelRef": channelRef,
        "itineraryStatus": itineraryStatus,
        "fromDate": fromDate,
        // "toDate": toDate.toIso8601String(),
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
