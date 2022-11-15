import 'dart:convert';

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
    required this.format,
  });

  int code;
  String message;
  List<TravelPlansListModel> data;
  int page;
  int limit;
  int size;
  bool hasMore;
  String format;

  factory TravelPlansModel.fromJson(Map<String, dynamic> json) =>
      TravelPlansModel(
        code: json["code"],
        message: json["message"],
        data: List<TravelPlansListModel>.from(
            json["data"].map((x) => TravelPlansListModel.fromJson(x))),
        page: json["page"],
        limit: json["limit"],
        size: json["size"],
        hasMore: json["hasMore"],
        format: json["format"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "page": page,
        "limit": limit,
        "size": size,
        "hasMore": hasMore,
        "format": format,
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
  });

  String id;
  String name;
  int price;
  int duration;
  int itineraryStatus;
  String description;
  String image;

  factory TravelPlansListModel.fromJson(Map<String, dynamic> json) =>
      TravelPlansListModel(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        duration: json["duration"],
        itineraryStatus: json["itineraryStatus"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "duration": duration,
        "itineraryStatus": itineraryStatus,
        "description": description,
        "image": image,
      };
}
