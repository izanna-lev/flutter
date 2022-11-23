// import 'dart:convert';
//
// ItineraryDetailsModel itineraryDetailsModelFromJson(String str) =>
//     ItineraryDetailsModel.fromJson(json.decode(str));
//
// String itineraryDetailsModelToJson(ItineraryDetailsModel data) =>
//     json.encode(data.toJson());
//
// class ItineraryDetailsModel {
//   ItineraryDetailsModel({
//     required this.code,
//     required this.message,
//     required this.data,
//   });
//
//   int code;
//   String message;
//   ItineraryDetailsListModel data;
//
//   factory ItineraryDetailsModel.fromJson(Map<String, dynamic> json) =>
//       ItineraryDetailsModel(
//         code: json["code"],
//         message: json["message"],
//         data: ItineraryDetailsListModel.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//         "data": data.toJson(),
//       };
// }
//
// class ItineraryDetailsListModel {
//   ItineraryDetailsListModel({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.dates,
//     required this.approved,
//     required this.submitted,
//     required this.cancellationRequest,
//     required this.itineraryStatus,
//     required this.additionalInformation,
//     required this.itinerary,
//     required this.rating,
//     required this.card,
//   });
//
//   String id;
//   String name;
//   int price;
//   String image;
//   List<DateTime> dates;
//   bool approved;
//   bool submitted;
//   bool card;
//   bool cancellationRequest;
//   int itineraryStatus;
//   String additionalInformation;
//   List<Itinerary> itinerary;
//   double rating;
//
//   factory ItineraryDetailsListModel.fromJson(Map<String, dynamic> json) =>
//       ItineraryDetailsListModel(
//         id: json["_id"] ?? "",
//         name: json["name"] ?? "",
//         price: json["price"] ?? 0,
//         image: json["image"] ?? "",
//         dates: List<DateTime>.from(json["dates"].map((x) => DateTime.parse(x))),
//         approved: json["approved"] ?? false,
//         submitted: json["submitted"] ?? false,
//         cancellationRequest: json["cancellationRequest"] ?? false,
//         card: json["card"] ?? false,
//         itineraryStatus: json["itineraryStatus"] ?? 0,
//         additionalInformation: json["additionalInformation"] ?? "",
//         itinerary: List<Itinerary>.from(
//             (json["itinerary"] ?? []).map((x) => Itinerary.fromJson(x))),
//         rating: json["rating"].toDouble(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "price": price,
//         "image": image,
//         "dates": List<dynamic>.from(dates.map((x) =>
//             "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
//         "approved": approved,
//         "submitted": submitted,
//         "cancellationRequest": cancellationRequest,
//         "card": card,
//         "itineraryStatus": itineraryStatus,
//         "additionalInformation": additionalInformation,
//         "itinerary": List<dynamic>.from(itinerary.map((x) => x.toJson())),
//         "rating": rating,
//       };
// }
//
// class Itinerary {
//   Itinerary({
//     required this.id,
//     required this.name,
//     required this.day,
//     required this.itineraryRef,
//     required this.reservationType,
//     required this.image,
//     required this.contactNumber,
//     required this.description,
//     required this.location,
//     required this.reservationDateTime,
//     required this.deleted,
//     // required this.createdAt,
//     // required this.updatedAt,
//     required this.itineraryV,
//     required this.date,
//     required this.detailType,
//     required this.depart,
//     required this.arrival,
//     required this.airline,
//     required this.flightClass,
//     required this.specialistNote,
//     required this.transportationType,
//     required this.arrivalDateTime,
//     required this.departDateTime,
//     required this.tickets,
//     required this.v,
//     required this.checkInDateTime,
//     required this.checkOutDateTime,
//   });
//
//   String id;
//   String name;
//   int day;
//   String itineraryRef;
//   int reservationType;
//   String image;
//   String contactNumber;
//   String description;
//   String location;
//   String reservationDateTime;
//   bool deleted;
//   // String createdAt;
//   // String updatedAt;
//   int itineraryV;
//   String date;
//   int detailType;
//   String depart;
//   String arrival;
//   String airline;
//   int flightClass;
//   String specialistNote;
//   int transportationType;
//   String arrivalDateTime;
//   String departDateTime;
//   List<Ticket> tickets;
//   int v;
//   String checkInDateTime;
//   String checkOutDateTime;
//
//   factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
//         id: json["_id"] ?? "",
//         name: json["name"] ?? "",
//         day: json["day"] ?? 0,
//         itineraryRef: json["itineraryRef"] ?? "",
//         reservationType: json["reservationType"] ?? 0,
//         image: json["image"] ?? "",
//         contactNumber: json["contactNumber"] ?? "",
//         description: json["description"] ?? "",
//         location: json["location"] ?? "",
//         reservationDateTime: json["reservationDateTime"] ?? "",
//         deleted: json["deleted"] ?? false,
//         // createdAt: DateTime.parse(json["createdAt"]),
//         // updatedAt: DateTime.parse(json["updatedAt"]),
//         itineraryV: json["v"] ?? 0,
//         date: json["date"] ?? "",
//         detailType: json["detailType"],
//         depart: json["depart"] ?? "",
//         arrival: json["arrival"] ?? "",
//         airline: json["airline"] ?? "",
//         flightClass: json["flightClass"] ?? 0,
//         specialistNote: json["specialistNote"] ?? "",
//         transportationType: json["transportationType"] ?? 0,
//         arrivalDateTime: json["arrivalDateTime"] ?? "",
//         departDateTime: json["departDateTime"] ?? "",
//         tickets: json["tickets"],
//         v: json["__v"] ?? 0,
//         checkInDateTime: json["checkInDateTime"] ?? "",
//         checkOutDateTime: json["checkOutDateTime"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "day": day,
//         "itineraryRef": itineraryRef,
//         "reservationType": reservationType,
//         "image": image,
//         "contactNumber": contactNumber,
//         "description": description,
//         "location": location,
//         "reservationDateTime": reservationDateTime,
//         "deleted": deleted,
//         // "createdAt": createdAt.toIso8601String(),
//         // "updatedAt": updatedAt.toIso8601String(),
//         "v": itineraryV,
//         "date": date,
//         "detailType": detailType,
//         "depart": depart,
//         "arrival": arrival,
//         "airline": airline,
//         "flightClass": flightClass,
//         "specialistNote": specialistNote,
//         "transportationType": transportationType,
//         "arrivalDateTime": arrivalDateTime,
//         "departDateTime": departDateTime,
//         "tickets": tickets == null
//             ? null
//             : List<dynamic>.from(tickets.map((x) => x.toJson())),
//         "__v": v,
//         "checkInDateTime": checkInDateTime,
//         "checkOutDateTime": checkOutDateTime,
//       };
// }
//
// class Arrival {
//   Arrival({
//     required this.coordinates,
//     required this.location,
//     required this.type,
//   });
//
//   List<double> coordinates;
//   String location;
//   String type;
//
//   factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
//         coordinates:
//             List<double>.from(json["coordinates"].map((x) => x.toDouble())),
//         location: json["location"] ?? "",
//         type: json["type"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
//         "location": location,
//         "type": type,
//       };
// }
//
// class Ticket {
//   Ticket({
//     required this.id,
//     required this.deleted,
//     required this.transportationRef,
//     required this.travellerName,
//     required this.ticketImage,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });
//
//   String id;
//   bool deleted;
//   String transportationRef;
//   String travellerName;
//   String ticketImage;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;
//
//   factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
//         id: json["_id"] ?? "",
//         deleted: json["deleted"] ?? false,
//         transportationRef: json["transportationRef"] ?? "",
//         travellerName: json["travellerName"] ?? "",
//         ticketImage: json["ticketImage"] ?? "",
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["v"] ?? 0,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "deleted": deleted,
//         "transportationRef": transportationRef,
//         "travellerName": travellerName,
//         "ticketImage": ticketImage,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "v": v,
//       };
// }
//
// // import 'dart:convert';
// //
// // ItineraryDetailsModel itineraryDetailsModelFromJson(String str) =>
// //     ItineraryDetailsModel.fromJson(json.decode(str));
// //
// // String itineraryDetailsModelToJson(ItineraryDetailsModel data) =>
// //     json.encode(data.toJson());
// //
// // class ItineraryDetailsModel {
// //   ItineraryDetailsModel({
// //     required this.code,
// //     required this.message,
// //     required this.data,
// //   });
// //
// //   int code;
// //   String message;
// //   List<ItineraryDetailsListModel> data;
// //
// //   factory ItineraryDetailsModel.fromJson(Map<String, dynamic> json) =>
// //       ItineraryDetailsModel(
// //         code: json["code"] ?? 0,
// //         message: json["message"] ?? "",
// //         data: List<ItineraryDetailsListModel>.from(
// //             json["data"].map((x) => ItineraryDetailsListModel.fromJson(x))),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "code": code,
// //         "message": message,
// //         "data": List<dynamic>.from(data.map((x) => x.toJson())),
// //       };
// // }
// //
// // class ItineraryDetailsListModel {
// //   ItineraryDetailsListModel({
// //     required this.id,
// //     required this.name,
// //     required this.price,
// //     required this.image,
// //     required this.approved,
// //     required this.submitted,
// //     required this.cancellationRequest,
// //     required this.itineraryStatus,
// //     required this.additionalInformation,
// //     required this.itinerary,
// //   });
// //
// //   String id;
// //   String name;
// //   int price;
// //   String image;
// //   bool approved;
// //   bool submitted;
// //   bool cancellationRequest;
// //   int itineraryStatus;
// //   String additionalInformation;
// //   List<Itinerary> itinerary;
// //
// //   factory ItineraryDetailsListModel.fromJson(Map<String, dynamic> json) =>
// //       ItineraryDetailsListModel(
// //         id: json["_id"] ?? "",
// //         name: json["name"] ?? "",
// //         price: json["price"] ?? 0,
// //         image: json["image"] ?? "",
// //         approved: json["approved"] ?? false,
// //         submitted: json["submitted"] ?? false,
// //         cancellationRequest: json["cancellationRequest"] ?? false,
// //         itineraryStatus: json["itineraryStatus"] ?? 0,
// //         additionalInformation: json["additionalInformation"] ?? "",
// //         itinerary: List<Itinerary>.from(
// //             json["itinerary"].map((x) => Itinerary.fromJson(x))),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "_id": id,
// //         "name": name,
// //         "price": price,
// //         "image": image,
// //         "approved": approved,
// //         "submitted": submitted,
// //         "cancellationRequest": cancellationRequest,
// //         "itineraryStatus": itineraryStatus,
// //         "additionalInformation": additionalInformation,
// //         "itinerary": List<dynamic>.from(itinerary.map((x) => x.toJson())),
// //       };
// // }
// //
// // class Itinerary {
// //   Itinerary({
// //     required this.id,
// //     required this.date,
// //     required this.transportationType,
// //     required this.specialistNote,
// //     required this.reservationType,
// //     required this.description,
// //   });
// //
// //   String id;
// //   DateTime date;
// //   int transportationType;
// //   String specialistNote;
// //   int reservationType;
// //   String description;
// //
// //   factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
// //         id: json["_id"] ?? "",
// //         date: DateTime.parse(json["date"] ?? ""),
// //         transportationType: json["transportationType"] ?? 0,
// //         reservationType: json["reservationType"] ?? "",
// //         specialistNote: json["specialistNote"] ?? 0,
// //         description: json["description"] ?? "",
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "_id": id,
// //         "date": date.toIso8601String(),
// //         "transportationType": transportationType,
// //         "specialistNote": specialistNote,
// //         "reservationType": reservationType,
// //         "description": description,
// //       };
// // }

import 'dart:convert';

ItineraryDetailsModel itineraryDetailsModelFromJson(String str) =>
    ItineraryDetailsModel.fromJson(json.decode(str));

String itineraryDetailsModelToJson(ItineraryDetailsModel data) =>
    json.encode(data.toJson());

class ItineraryDetailsModel {
  ItineraryDetailsModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  ItineraryDetailsListModel data;

  factory ItineraryDetailsModel.fromJson(Map<String, dynamic> json) =>
      ItineraryDetailsModel(
        code: json["code"],
        message: json["message"],
        data: ItineraryDetailsListModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class ItineraryDetailsListModel {
  ItineraryDetailsListModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.dates,
    required this.card,
    required this.approved,
    required this.cancellationRequest,
    required this.itineraryStatus,
    required this.additionalInformation,
    required this.itinerary,
    required this.rating,
  });

  String id;
  String name;
  int price;
  String image;
  List<DateTime> dates;
  bool card;
  bool approved;
  bool cancellationRequest;
  int itineraryStatus;
  String additionalInformation;
  List<Itinerary> itinerary;
  double rating;

  factory ItineraryDetailsListModel.fromJson(Map<String, dynamic> json) =>
      ItineraryDetailsListModel(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        price: json["price"] ?? 0,
        image: json["image"] ?? "",
        dates: List<DateTime>.from(
            (json["dates"] ?? []).map((x) => DateTime.parse(x))),
        card: json["card"] ?? false,
        approved: json["approved"] ?? false,
        cancellationRequest: json["cancellationRequest"] ?? false,
        itineraryStatus: json["itineraryStatus"] ?? 0,
        additionalInformation: json["additionalInformation"] ?? "",
        itinerary: List<Itinerary>.from(
            (json["itinerary"] ?? []).map((x) => Itinerary.fromJson(x))),
        rating: json["rating"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "image": image,
        "dates": List<dynamic>.from(dates.map((x) =>
            "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "card": card,
        "approved": approved,
        "cancellationRequest": cancellationRequest,
        "itineraryStatus": itineraryStatus,
        "additionalInformation": additionalInformation,
        "itinerary": List<dynamic>.from(itinerary.map((x) => x.toJson())),
        "rating": rating,
      };
}

class Itinerary {
  Itinerary(
      {required this.id,
      required this.itineraryRef,
      required this.airline,
      required this.flightClass,
      required this.day,
      required this.departDateTime,
      required this.arrivalDateTime,
      required this.depart,
      required this.arrival,
      required this.specialistNote,
      required this.transportationType,
      required this.deleted,
      required this.v,
      required this.tickets,
      required this.date,
      required this.detailType,
      required this.name,
      required this.reservationType,
      required this.image,
      required this.contactNumber,
      required this.phoneCode,
      required this.description,
      required this.location,
      required this.checkInDateTime,
      required this.checkOutDateTime,
      required this.trainClass});

  String id;
  String itineraryRef;
  String airline;
  int flightClass;
  int trainClass;
  int day;
  String departDateTime;
  String arrivalDateTime;
  Arrival? depart;
  Arrival? arrival;
  String specialistNote;
  int transportationType;
  bool deleted;
  int v;
  List<Ticket> tickets;
  String date;
  int detailType;
  String name;
  int reservationType;
  String image;
  String contactNumber;
  String phoneCode;
  String description;
  Arrival? location;
  String checkInDateTime;
  String checkOutDateTime;

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        id: json["_id"] ?? "",
        itineraryRef: json["itineraryRef"] ?? "",
        trainClass: json["trainClass"] ?? 0,
        airline: json["airline"] ?? "",
        flightClass: json["flightClass"] ?? 0,
        day: json["day"] ?? 0,
        departDateTime: json["departDateTime"] ?? "",
        arrivalDateTime: json["arrivalDateTime"] ?? "",
        depart:
            json["depart"] == null ? null : Arrival.fromJson(json["depart"]),
        arrival:
            json["arrival"] == null ? null : Arrival.fromJson(json["arrival"]),
        specialistNote: json["specialistNote"] ?? "",
        transportationType: json["transportationType"] ?? 0,
        deleted: json["deleted"] ?? false,
        v: json["__v"] ?? 0,
        tickets: List<Ticket>.from(
            (json["tickets"] ?? []).map((x) => Ticket.fromJson(x))),
        date: json["date"] ?? "",
        detailType: json["detailType"] ?? 0,
        name: json["name"] ?? "",
        reservationType: json["reservationType"] ?? 0,
        image: json["image"] ?? "",
        contactNumber: json["contactNumber"] ?? "",
        phoneCode: json["phoneCode"] ?? "",
        description: json["description"] ?? "",
        location: (json["location"] == null)
            ? null
            : Arrival.fromJson(json["location"]),
        checkInDateTime: json["checkInDateTime"] ?? "",
        checkOutDateTime: json["checkOutDateTime"] ?? "",
        // depart: json["depart"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "itineraryRef": itineraryRef,
        "airline": airline,
        "flightClass": flightClass,
        "day": day,
        "departDateTime": departDateTime,
        "arrivalDateTime": arrivalDateTime,
        "depart": depart == null ? null : depart!.toJson(),
        "arrival": arrival == null ? null : arrival!.toJson(),
        "specialistNote": specialistNote,
        "transportationType": transportationType,
        "deleted": deleted,
        "__v": v,
        "tickets": List<dynamic>.from(tickets.map((x) => x.toJson())),
        "date": date,
        "detailType": detailType,
        "name": name,
        "reservationType": reservationType,
        "image": image,
        "contactNumber": contactNumber,
        "phoneCode": phoneCode,
        "description": description,
        "location": location == null ? null : location!.toJson(),
        "checkInDateTime": checkInDateTime,
        "checkOutDateTime": checkOutDateTime,
        "trainClass": trainClass
      };
}

class Arrival {
  Arrival({
    required this.location,
    required this.type,
    required this.coordinates,
  });

  String location;
  String type;
  List<double> coordinates;

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        location: json["location"] ?? "",
        type: json["type"] ?? "",
        coordinates: List<double>.from(
            (json["coordinates"] ?? []).map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class Ticket {
  Ticket({
    required this.id,
    required this.transportationRef,
    required this.image,
    required this.name,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String transportationRef;
  String image;
  String name;
  bool deleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["_id"],
        transportationRef: json["transportationRef"],
        image: json["image"],
        name: json["name"],
        deleted: json["deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "transportationRef": transportationRef,
        "image": image,
        "name": name,
        "deleted": deleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
