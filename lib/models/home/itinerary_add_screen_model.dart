import 'dart:convert';

ItineraryAddModel itineraryAddModelFromJson(String str) =>
    ItineraryAddModel.fromJson(json.decode(str));

String itineraryAddModelToJson(ItineraryAddModel data) =>
    json.encode(data.toJson());

class ItineraryAddModel {
  ItineraryAddModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  ItineraryAddListModel data;

  factory ItineraryAddModel.fromJson(Map<String, dynamic> json) =>
      ItineraryAddModel(
        code: json["code"],
        message: json["message"],
        data: ItineraryAddListModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class ItineraryAddListModel {
  ItineraryAddListModel({
    required this.travellerRef,
    required this.firstName,
    required this.lastName,
    required this.contactNumber,
    required this.phoneCode,
    required this.location,
    required this.travellers,
    required this.plannedDate,
    required this.plannedTraveller,
    required this.id,
  });

  String travellerRef;
  String firstName;
  String lastName;
  String contactNumber;
  String phoneCode;
  String location;
  int travellers;
  DateTime plannedDate;
  int plannedTraveller;
  String id;

  factory ItineraryAddListModel.fromJson(Map<String, dynamic> json) =>
      ItineraryAddListModel(
        travellerRef: json["travellerRef"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        contactNumber: json["contactNumber"],
        phoneCode: json["phoneCode"],
        location: json["location"],
        travellers: json["travellers"],
        plannedDate: DateTime.parse(json["plannedDate"]),
        plannedTraveller: json["plannedTraveller"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "travellerRef": travellerRef,
        "firstName": firstName,
        "lastName": lastName,
        "contactNumber": contactNumber,
        "phoneCode": phoneCode,
        "location": location,
        "travellers": travellers,
        "plannedDate": plannedDate.toIso8601String(),
        "plannedTraveller": plannedTraveller,
        "_id": id,
      };
}
