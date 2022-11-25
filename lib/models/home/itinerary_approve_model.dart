import 'dart:convert';

ItineraryApproveModel itineraryApproveModelFromJson(String str) =>
    ItineraryApproveModel.fromJson(json.decode(str));

String itineraryApproveModelToJson(ItineraryApproveModel data) =>
    json.encode(data.toJson());

class ItineraryApproveModel {
  ItineraryApproveModel({
    required this.code,
    required this.message,
    required this.data,
    required this.format,
    required this.timestamp,
  });

  int code;
  String message;
  ItineraryApproveDataModel data;
  String format;
  String timestamp;

  factory ItineraryApproveModel.fromJson(Map<String, dynamic> json) =>
      ItineraryApproveModel(
        code: json["code"],
        message: json["message"],
        data: ItineraryApproveDataModel.fromJson(json["data"]),
        format: json["format"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
        "format": format,
        "timestamp": timestamp,
      };
}

class ItineraryApproveDataModel {
  ItineraryApproveDataModel({
    required this.location,
    required this.isRequestCancel,
    required this.id,
    required this.paymentStatus,
    required this.isPassport,
    required this.isDrivingLicense,
    required this.deleted,
    required this.name,
    required this.travellerRef,
    required this.specialistRef,
    required this.itineraryType,
    required this.specialistNote,
    required this.specificRestrictionsAndRegulations,
    required this.fromDate,
    required this.toDate,
    required this.plannedTraveller,
    required this.price,
    required this.image,
    required this.duration,
    required this.itineraryStatus,
    required this.guests,
    required this.rooms,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.formRef,
    required this.email,
    required this.isCancelRequest,
    required this.approved,
    required this.submitted,
    required this.cancellationRequest,
  });

  Location location;
  bool isRequestCancel;
  String id;
  int paymentStatus;
  bool isPassport;
  bool isDrivingLicense;
  bool deleted;
  String name;
  String travellerRef;
  String specialistRef;
  int itineraryType;
  String specialistNote;
  String specificRestrictionsAndRegulations;
  String fromDate;
  String toDate;
  int plannedTraveller;
  int price;
  String image;
  int duration;
  int itineraryStatus;
  int guests;
  int rooms;
  String createdAt;
  String updatedAt;
  int v;
  String formRef;
  String email;
  bool isCancelRequest;
  bool approved;
  bool submitted;
  String cancellationRequest;

  factory ItineraryApproveDataModel.fromJson(Map<String, dynamic> json) =>
      ItineraryApproveDataModel(
        location: Location.fromJson(json["location"]),
        isRequestCancel: json["isRequestCancel"] ?? false,
        id: json["_id"] ?? "",
        paymentStatus: json["paymentStatus"] ?? 0,
        isPassport: json["isPassport"] ?? false,
        isDrivingLicense: json["isDrivingLicense"] ?? false,
        deleted: json["deleted"] ?? false,
        name: json["name"] ?? "",
        travellerRef: json["travellerRef"] ?? "",
        specialistRef: json["specialistRef"] ?? "",
        itineraryType: json["itineraryType"] ?? 0,
        specialistNote: json["specialistNote"] ?? "",
        specificRestrictionsAndRegulations:
            json["specificRestrictionsAndRegulations"] ?? "",
        fromDate: json["fromDate"] ?? "",
        toDate: json["toDate"] ?? "",
        plannedTraveller: json["plannedTraveller"] ?? 0,
        price: json["price"] ?? 0,
        image: json["image"] ?? "",
        duration: json["duration"] ?? 0,
        itineraryStatus: json["itineraryStatus"] ?? 0,
        guests: json["guests"] ?? 0,
        rooms: json["rooms"] ?? 0,
        createdAt: json["createdAt"] ?? "",
        updatedAt: json["updatedAt"] ?? "",
        v: json["__v"] ?? 0,
        formRef: json["formRef"] ?? "",
        email: json["email"] ?? "",
        isCancelRequest: json["isCancelRequest"] ?? false,
        approved: json["approved"] ?? false,
        submitted: json["submitted"] ?? false,
        cancellationRequest: json["cancellationRequest"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "isRequestCancel": isRequestCancel,
        "_id": id,
        "paymentStatus": paymentStatus,
        "isPassport": isPassport,
        "isDrivingLicense": isDrivingLicense,
        "deleted": deleted,
        "name": name,
        "travellerRef": travellerRef,
        "specialistRef": specialistRef,
        "itineraryType": itineraryType,
        "specialistNote": specialistNote,
        "specificRestrictionsAndRegulations":
            specificRestrictionsAndRegulations,
        "fromDate": fromDate,
        "toDate": toDate,
        "plannedTraveller": plannedTraveller,
        "price": price,
        "image": image,
        "duration": duration,
        "itineraryStatus": itineraryStatus,
        "guests": guests,
        "rooms": rooms,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "formRef": formRef,
        "email": email,
        "isCancelRequest": isCancelRequest,
        "approved": approved,
        "submitted": submitted,
        "cancellationRequest": cancellationRequest,
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
