import 'dart:convert';
import 'dart:ffi';

TravelPlansModel travelPlansModelFromJson(String str) =>
    TravelPlansModel.fromJson(json.decode(str));

String travelPlansModelToJson(TravelPlansModel data) =>
    json.encode(data.toJson());

class TravelPlansModel {
  TravelPlansModel({
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
  List<TravelPlansListModel> data;
  int page;
  int limit;
  int size;
  bool hasMore;

  factory TravelPlansModel.fromJson(Map<String, dynamic> json) =>
      TravelPlansModel(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: List<TravelPlansListModel>.from(
            json["data"].map((x) => TravelPlansListModel.fromJson(x))),
        page: json["page"] ?? 0,
        limit: json["limit"] ?? 0,
        size: json["size"] ?? 0,
        hasMore: json["hasMore"] ?? false,
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

class TravelPlansListModel {
  TravelPlansListModel({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
    required this.itineraryStatus,
    required this.description,
    required this.image,
    required this.approved,
  });

  String id;
  String name;
  int price;
  int duration;
  int itineraryStatus;
  String description;
  String image;
  bool approved;

  factory TravelPlansListModel.fromJson(Map<String, dynamic> json) =>
      TravelPlansListModel(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        price: json["price"] ?? 0,
        duration: json["duration"] ?? 0,
        itineraryStatus: json["itineraryStatus"] ?? 0,
        description: json["description"] ?? "",
        image: json["image"] ?? "",
        approved: json["approved"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "duration": duration,
        "itineraryStatus": itineraryStatus,
        "description": description,
        "image": image,
        "approved": approved,
      };
}
