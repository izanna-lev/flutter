// import 'dart:convert';
//
// MessageModel messageModelFromJson(String str) =>
//     MessageModel.fromJson(json.decode(str));
//
// String messageModelToJson(MessageModel data) => json.encode(data.toJson());
//
// class MessageModel {
//   MessageModel({
//     required this.code,
//     required this.message,
//     required this.data,
//   });
//
//   int code;
//   String message;
//   MessageDataModel data;
//
//   factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
//         code: json["code"],
//         message: json["message"],
//         data: MessageDataModel.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//         "data": data.toJson(),
//       };
// }
//
// class MessageDataModel {
//   MessageDataModel({
//     required this.messages,
//     required this.itinerary,
//   });
//
//   List<Message> messages;
//   Itinerary itinerary;
//
//   factory MessageDataModel.fromJson(Map<String, dynamic> json) =>
//       MessageDataModel(
//         messages: List<Message>.from(
//             json["messages"].map((x) => Message.fromJson(x))),
//         itinerary: Itinerary.fromJson(json["itinerary"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
//         "itinerary": itinerary.toJson(),
//       };
// }
//
// class Itinerary {
//   Itinerary({
//     required this.id,
//     required this.location,
//     required this.itineraryStatus,
//     required this.image,
//     required this.fromDate,
//     required this.toDate,
//     required this.otherUserName,
//   });
//
//   String id;
//   Location location;
//   int itineraryStatus;
//   String image;
//   DateTime fromDate;
//   DateTime toDate;
//   String otherUserName;
//
//   factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
//         id: json["_id"],
//         location: Location.fromJson(json["location"]),
//         itineraryStatus: json["itineraryStatus"],
//         image: json["image"],
//         fromDate: DateTime.parse(json["fromDate"]),
//         toDate: DateTime.parse(json["toDate"]),
//         otherUserName: json["otherUserName"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "location": location.toJson(),
//         "itineraryStatus": itineraryStatus,
//         "image": image,
//         "fromDate": fromDate.toIso8601String(),
//         "toDate": toDate.toIso8601String(),
//         "otherUserName": otherUserName,
//       };
// }
//
// class Location {
//   Location({
//     required this.location,
//     required this.type,
//     required this.coordinates,
//   });
//
//   String location;
//   String type;
//   List<double> coordinates;
//
//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//         location: json["location"],
//         type: json["type"],
//         coordinates:
//             List<double>.from(json["coordinates"].map((x) => x.toDouble())),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "location": location,
//         "type": type,
//         "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
//       };
// }
//
// class Message {
//   Message({
//     this.id,
//     this.specialist,
//     this.userRef,
//     this.channelRef,
//     this.message,
//     this.createdOn,
//     this.messageType,
//     this.updatedOn,
//     this.traveller,
//     this.admin,
//     // required this.id,
//     // required this.specialist,
//     // required this.userRef,
//     // required this.channelRef,
//     // required this.message,
//     // required this.createdOn,
//     // required this.messageType,
//     // required this.updatedOn,
//     // required this.traveller,
//     // required this.admin,
//   });
//
//   String? id;
//   Specialist? specialist;
//   String? userRef;
//   String? channelRef;
//   String? message;
//   String? createdOn;
//   int? messageType;
//   String? updatedOn;
//   Admin? traveller;
//   Admin? admin;
//
//   factory Message.fromJson(Map<String, dynamic> json) => Message(
//         id: json["_id"] ?? "",
//         specialist: json["specialist"],
//         userRef: json["userRef"] ?? "",
//         channelRef: json["channelRef"] ?? "",
//         message: json["message"] ?? "",
//         createdOn: json["createdOn"] ?? "",
//         messageType: json["messageType"] ?? 0,
//         updatedOn: json["updatedOn"] ?? "",
//         traveller: json["traveller"],
//         admin: json["admin"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "specialist": specialist,
//         "userRef": userRef,
//         "channelRef": channelRef,
//         "message": message,
//         "createdOn": createdOn,
//         "messageType": messageType,
//         "updatedOn": updatedOn,
//         "traveller": traveller,
//         "admin": admin,
//       };
// }
//
// class Admin {
//   Admin({
//     required this.name,
//   });
//
//   String name;
//
//   factory Admin.fromJson(Map<String, dynamic> json) => Admin(
//         name: json["name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//       };
// }
//
// class Specialist {
//   Specialist({
//     required this.name,
//     required this.image,
//   });
//
//   String name;
//   String image;
//
//   factory Specialist.fromJson(Map<String, dynamic> json) => Specialist(
//         name: json["name"],
//         image: json["image"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "image": image,
//       };
// }
//
// // import 'dart:convert';
// //
// // MessageModel messageModelFromJson(String str) =>
// //     MessageModel.fromJson(json.decode(str));
// //
// // String messageModelToJson(MessageModel data) => json.encode(data.toJson());
// //
// // class MessageModel {
// //   MessageModel({
// //     required this.code,
// //     required this.message,
// //     required this.data,
// //   });
// //
// //   int code;
// //   String message;
// //   MessageDataModel data;
// //
// //   factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
// //         code: json["code"],
// //         message: json["message"],
// //         data: MessageDataModel.fromJson(json["data"]),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "code": code,
// //         "message": message,
// //         "data": data.toJson(),
// //       };
// // }
// //
// // class MessageDataModel {
// //   MessageDataModel({
// //     required this.messages,
// //     required this.itinerary,
// //   });
// //
// //   List<Message> messages;
// //   Itinerary itinerary;
// //
// //   factory MessageDataModel.fromJson(Map<String, dynamic> json) =>
// //       MessageDataModel(
// //         messages: List<Message>.from(
// //             json["messages"].map((x) => Message.fromJson(x))),
// //         itinerary: Itinerary.fromJson(json["itinerary"]),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
// //         "itinerary": itinerary.toJson(),
// //       };
// // }
// //
// // class Itinerary {
// //   Itinerary({
// //     required this.id,
// //     required this.location,
// //     required this.itineraryStatus,
// //     required this.image,
// //     required this.fromDate,
// //     required this.toDate,
// //     required this.otherUserName,
// //   });
// //
// //   String id;
// //   Location location;
// //   int itineraryStatus;
// //   String image;
// //   String fromDate;
// //   String toDate;
// //   String otherUserName;
// //
// //   factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
// //         id: json["_id"] ?? "",
// //         location: Location.fromJson(json["location"]),
// //         itineraryStatus: json["itineraryStatus"] ?? 0,
// //         image: json["image"] ?? "",
// //         fromDate: json["fromDate"] ?? "",
// //         toDate: json["toDate"] ?? "",
// //         otherUserName: json["otherUserName"] ?? "",
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "_id": id,
// //         "location": location.toJson(),
// //         "itineraryStatus": itineraryStatus,
// //         "image": image,
// //         "fromDate": fromDate,
// //         "toDate": toDate,
// //         "otherUserName": otherUserName,
// //       };
// // }
// //
// // class Location {
// //   Location({
// //     required this.location,
// //     required this.type,
// //     required this.coordinates,
// //   });
// //
// //   String location;
// //   String type;
// //   List<double> coordinates;
// //
// //   factory Location.fromJson(Map<String, dynamic> json) => Location(
// //         location: json["location"] ?? "",
// //         type: json["type"] ?? "",
// //         coordinates:
// //             List<double>.from(json["coordinates"].map((x) => x.toDouble())),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "location": location,
// //         "type": type,
// //         "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
// //       };
// // }
// //
// // class Message {
// //   Message({
// //     required this.id,
// //     required this.specialist,
// //     required this.userRef,
// //     required this.channelRef,
// //     required this.message,
// //     required this.createdOn,
// //     required this.messageType,
// //     required this.updatedOn,
// //     required this.traveller,
// //     required this.admin,
// //   });
// //
// //   String id;
// //   Specialist specialist;
// //   String userRef;
// //   String channelRef;
// //   String message;
// //   String createdOn;
// //   int messageType;
// //   String updatedOn;
// //   Admin traveller;
// //   Admin admin;
// //
// //   factory Message.fromJson(Map<String, dynamic> json) => Message(
// //         id: json["_id"] ?? "",
// //         specialist: json["specialist"],
// //         userRef: json["userRef"] ?? "",
// //         channelRef: json["channelRef"] ?? "",
// //         message: json["message"] ?? "",
// //         createdOn: json["createdOn"] ?? "",
// //         messageType: json["messageType"] ?? 0,
// //         updatedOn: json["updatedOn"] ?? "",
// //         traveller: json["traveller"],
// //         admin: json["admin"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "_id": id,
// //         "specialist": specialist,
// //         "userRef": userRef,
// //         "channelRef": channelRef,
// //         "message": message,
// //         "createdOn": createdOn,
// //         "messageType": messageType,
// //         "updatedOn": updatedOn,
// //         "traveller": traveller,
// //         "admin": admin,
// //       };
// // }
// //
// // class Admin {
// //   Admin({
// //     required this.name,
// //   });
// //
// //   String name;
// //
// //   factory Admin.fromJson(Map<String, dynamic> json) => Admin(
// //         name: json["name"] ?? "",
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "name": name,
// //       };
// // }
// //
// // class Specialist {
// //   Specialist({
// //     required this.name,
// //     required this.image,
// //   });
// //
// //   String name;
// //   String image;
// //
// //   factory Specialist.fromJson(Map<String, dynamic> json) => Specialist(
// //         name: json["name"] ?? "",
// //         image: json["image"] ?? "",
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "name": name,
// //         "image": image,
// //       };
// // }
