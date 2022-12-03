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
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
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
    required this.specialistRef,
    required this.adminRef,
    required this.specialistName,
    required this.cancellationRequest,
    required this.itineraryStatus,
    required this.additionalInformation,
    required this.itinerary,
    required this.rating,
    required this.isRated,
  });

  String id;
  String name;
  int price;
  String image;
  List<DateTime> dates;
  bool card;
  bool approved;
  String specialistRef;
  String adminRef;
  String specialistName;
  bool cancellationRequest;
  int itineraryStatus;
  String additionalInformation;
  List<Itinerary> itinerary;
  dynamic rating;
  bool isRated;

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
        specialistRef: json["specialistRef"] ?? "",
        adminRef: json["adminRef"] ?? "",
        specialistName: json["specialistName"] ?? "",
        cancellationRequest: json["cancellationRequest"] ?? false,
        itineraryStatus: json["itineraryStatus"] ?? 0,
        additionalInformation: json["additionalInformation"] ?? "",
        rating: json["rating"],
        itinerary: List<Itinerary>.from(
            json["itinerary"].map((x) => Itinerary.fromJson(x))),
        isRated: json["isRated"] ?? false,
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
        "specialistRef": specialistRef,
        "adminRef": adminRef,
        "specialistName": specialistName,
        "cancellationRequest": cancellationRequest,
        "itineraryStatus": itineraryStatus,
        "additionalInformation": additionalInformation,
        "itinerary": List<dynamic>.from(itinerary.map((x) => x.toJson())),
        "rating": rating,
        "isRated": isRated
      };
}

class Itinerary {
  Itinerary({
    required this.id,
    required this.itineraryRef,
    required this.day,
    required this.image,
    required this.description,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.date,
    required this.detailType,
    required this.airline,
    required this.flightClass,
    required this.specialistNote,
    required this.transportationType,
    required this.tickets,
    required this.location,
    required this.name,
    required this.reservationType,
    required this.reservationDateTime,
    required this.trainClass,
    required this.contactNumber,
    required this.phoneCode,
    required this.checkInDateTime,
    required this.checkOutDateTime,
    required this.coordinates,
    required this.departLocation,
    required this.arrivalLocation,
    required this.departDateTime,
    required this.arrivalDateTime,
    // required this.userCarDetails,
  });

  String id;
  String itineraryRef;
  int day;
  String image;
  String description;
  bool deleted;
  String createdAt;
  String updatedAt;
  int v;
  String date;
  int detailType;
  String airline;
  int flightClass;
  String specialistNote;
  int transportationType;
  List<Ticket> tickets;
  String location;
  String name;
  int reservationType;
  String reservationDateTime;
  int trainClass;
  String contactNumber;
  String phoneCode;
  String checkInDateTime;
  String checkOutDateTime;
  List<double> coordinates;
  String departLocation;
  String arrivalLocation;
  String departDateTime;
  String arrivalDateTime;
  //UserCarDetails userCarDetails;

  factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
        id: json["_id"] ?? "",
        itineraryRef: json["itineraryRef"] ?? "",
        day: json["day"] ?? 0,
        image: json["image"] ?? "",
        description: json["description"] ?? "",
        deleted: json["deleted"] ?? false,
        createdAt: json["createdAt"] ?? "",
        updatedAt: json["updatedAt"] ?? "",
        v: json["__v"] ?? 0,
        date: json["date"] ?? "",
        detailType: json["detailType"] ?? 0,
        airline: json["airline"] ?? "",
        flightClass: json["flightClass"] ?? 0,
        specialistNote: json["specialistNote"] ?? "",
        transportationType: json["transportationType"] ?? 0,
        tickets: List<Ticket>.from(
            (json["tickets"] ?? []).map((x) => Ticket.fromJson(x))),
        location: json["location"] ?? "",
        reservationType: json["reservationType"] ?? 0,
        name: json["name"] ?? "",
        reservationDateTime: json["reservationDateTime"] ?? "",
        contactNumber: json["contactNumber"] ?? "",
        trainClass: json["trainClass"] ?? 0,
        phoneCode: json["phoneCode"] ?? "",
        checkInDateTime: json["checkInDateTime"] ?? "",
        checkOutDateTime: json["checkOutDateTime"] ?? "",
        coordinates: List<double>.from(
            (json["coordinates"] ?? []).map((x) => x.toDouble())),
        departLocation: json["departLocation"] ?? "",
        arrivalLocation: json["arrivalLocation"] ?? "",
        arrivalDateTime: json["arrivalDateTime"] ?? "",
        departDateTime: json["departDateTime"] ?? "",
        // userCarDetails: json["userCarDetails"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "itineraryRef": itineraryRef,
        "day": day,
        "image": image,
        "description": description,
        "deleted": deleted,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "date": date,
        "detailType": detailType,
        "airline": airline,
        "flightClass": flightClass,
        "specialistNote": specialistNote,
        "transportationType": transportationType,
        "tickets": List<dynamic>.from(tickets.map((x) => x.toJson())),
        "location": location,
        "name": name,
        "reservationType": reservationType,
        "reservationDateTime": reservationDateTime,
        "trainClass": trainClass,
        "contactNumber": contactNumber,
        "phoneCode": phoneCode,
        "checkInDateTime": checkInDateTime,
        "checkOutDateTime": checkOutDateTime,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "departLocation": departLocation,
        "arrivalLocation": arrivalLocation,
        "departDateTime": departDateTime,
        "arrivalDateTime": arrivalDateTime,
        // "userCarDetails": userCarDetails,
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
  String createdAt;
  String updatedAt;
  int v;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["_id"] ?? "",
        transportationRef: json["transportationRef"] ?? "",
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        deleted: json["deleted"] ?? false,
        createdAt: json["createdAt"] ?? "",
        updatedAt: json["updatedAt"] ?? "",
        v: json["__v"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "transportationRef": transportationRef,
        "image": image,
        "name": name,
        "deleted": deleted,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
      };
}

class UserCarDetails {
  UserCarDetails({
    required this.driverName,
    required this.carImage,
    required this.noOfTravellers,
  });

  String driverName;
  String carImage;
  String noOfTravellers;

  factory UserCarDetails.fromJson(Map<String, dynamic> json) => UserCarDetails(
        driverName: json["driverName"] ?? "",
        carImage: json["carImage"] ?? "",
        noOfTravellers: json["noOfTravellers"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "driverName": driverName,
        "carImage": carImage,
        "noOfTravellers": noOfTravellers,
      };
}

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
//     required this.card,
//     required this.approved,
//     required this.cancellationRequest,
//     required this.itineraryStatus,
//     required this.additionalInformation,
//     required this.itinerary,
//     required this.rating,
//     required this.specialistRef,
//     required this.specialistName,
//   });
//
//   String id;
//   String name;
//   int price;
//   String image;
//   List<DateTime> dates;
//   bool card;
//   bool approved;
//   bool cancellationRequest;
//   int itineraryStatus;
//   String additionalInformation;
//   String specialistRef;
//   String specialistName;
//   List<Itinerary> itinerary;
//   int rating;
//
//   factory ItineraryDetailsListModel.fromJson(Map<String, dynamic> json) =>
//       ItineraryDetailsListModel(
//         id: json["_id"] ?? "",
//         name: json["name"] ?? "",
//         price: json["price"] ?? 0,
//         image: json["image"] ?? "",
//         dates: List<DateTime>.from(
//             (json["dates"] ?? []).map((x) => DateTime.parse(x))),
//         card: json["card"] ?? false,
//         approved: json["approved"] ?? false,
//         cancellationRequest: json["cancellationRequest"] ?? false,
//         itineraryStatus: json["itineraryStatus"] ?? 0,
//         additionalInformation: json["additionalInformation"] ?? "",
//         specialistRef: json["specialistRef"] ?? "",
//         specialistName: json["specialistName"] ?? "",
//         itinerary: List<Itinerary>.from(
//             (json["itinerary"] ?? []).map((x) => Itinerary.fromJson(x))),
//         rating: json["rating"] ?? 0,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "price": price,
//         "image": image,
//         "dates": List<dynamic>.from(dates.map((x) =>
//             "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
//         "card": card,
//         "approved": approved,
//         "cancellationRequest": cancellationRequest,
//         "itineraryStatus": itineraryStatus,
//         "additionalInformation": additionalInformation,
//         "specialistName": specialistName,
//         "specialistRef": specialistRef,
//         "itinerary": List<dynamic>.from(itinerary.map((x) => x.toJson())),
//         "rating": rating,
//       };
// }
//
// class Itinerary {
//   Itinerary({
//     required this.id,
//     required this.itineraryRef,
//     required this.airline,
//     required this.flightClass,
//     required this.day,
//     required this.departDateTime,
//     required this.arrivalDateTime,
//     required this.depart,
//     required this.arrival,
//     required this.specialistNote,
//     required this.transportationType,
//     required this.deleted,
//     required this.v,
//     required this.tickets,
//     required this.date,
//     required this.detailType,
//     required this.name,
//     required this.reservationType,
//     required this.image,
//     required this.contactNumber,
//     required this.phoneCode,
//     required this.description,
//     required this.location,
//     required this.checkInDateTime,
//     required this.checkOutDateTime,
//     required this.trainClass,
//     required this.otherUserName,
//   });
//
//   String id;
//   String itineraryRef;
//   String airline;
//   int flightClass;
//   int trainClass;
//   int day;
//   String departDateTime;
//   String arrivalDateTime;
//   Arrival? depart;
//   Arrival? arrival;
//   String specialistNote;
//   int transportationType;
//   bool deleted;
//   int v;
//   List<Ticket> tickets;
//   String date;
//   int detailType;
//   String name;
//   int reservationType;
//   String image;
//   String contactNumber;
//   String phoneCode;
//   String description;
//   Arrival? location;
//   String checkInDateTime;
//   String checkOutDateTime;
//   String otherUserName;
//
//   factory Itinerary.fromJson(Map<String, dynamic> json) => Itinerary(
//         id: json["_id"] ?? "",
//         itineraryRef: json["itineraryRef"] ?? "",
//         trainClass: json["trainClass"] ?? 0,
//         airline: json["airline"] ?? "",
//         flightClass: json["flightClass"] ?? 0,
//         day: json["day"] ?? 0,
//         departDateTime: json["departDateTime"] ?? "",
//         arrivalDateTime: json["arrivalDateTime"] ?? "",
//         depart:
//             json["depart"] == null ? null : Arrival.fromJson(json["depart"]),
//         arrival:
//             json["arrival"] == null ? null : Arrival.fromJson(json["arrival"]),
//         specialistNote: json["specialistNote"] ?? "",
//         transportationType: json["transportationType"] ?? 0,
//         deleted: json["deleted"] ?? false,
//         v: json["__v"] ?? 0,
//         tickets: List<Ticket>.from(
//             (json["tickets"] ?? []).map((x) => Ticket.fromJson(x))),
//         date: json["date"] ?? "",
//         detailType: json["detailType"] ?? 0,
//         name: json["name"] ?? "",
//         reservationType: json["reservationType"] ?? 0,
//         image: json["image"] ?? "",
//         contactNumber: json["contactNumber"] ?? "",
//         phoneCode: json["phoneCode"] ?? "",
//         description: json["description"] ?? "",
//         location: (json["location"] == null)
//             ? null
//             : Arrival.fromJson(json["location"]),
//         checkInDateTime: json["checkInDateTime"] ?? "",
//         checkOutDateTime: json["checkOutDateTime"] ?? "",
//         otherUserName: json["otherUserName"] ?? "",
//         // depart: json["depart"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "itineraryRef": itineraryRef,
//         "airline": airline,
//         "flightClass": flightClass,
//         "day": day,
//         "departDateTime": departDateTime,
//         "arrivalDateTime": arrivalDateTime,
//         "depart": depart == null ? null : depart!.toJson(),
//         "arrival": arrival == null ? null : arrival!.toJson(),
//         "specialistNote": specialistNote,
//         "transportationType": transportationType,
//         "deleted": deleted,
//         "__v": v,
//         "tickets": List<dynamic>.from(tickets.map((x) => x.toJson())),
//         "date": date,
//         "detailType": detailType,
//         "name": name,
//         "reservationType": reservationType,
//         "image": image,
//         "contactNumber": contactNumber,
//         "phoneCode": phoneCode,
//         "description": description,
//         "location": location == null ? null : location!.toJson(),
//         "checkInDateTime": checkInDateTime,
//         "checkOutDateTime": checkOutDateTime,
//         "trainClass": trainClass,
//         "otherUserName": otherUserName,
//       };
// }
//
// class Arrival {
//   Arrival({
//     required this.location,
//     required this.type,
//     required this.coordinates,
//   });
//
//   String location;
//   String type;
//   List<double> coordinates;
//
//   factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
//         location: json["location"] ?? "",
//         type: json["type"] ?? "",
//         coordinates: List<double>.from(
//             (json["coordinates"] ?? []).map((x) => x.toDouble())),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "location": location,
//         "type": type,
//         "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
//       };
// }
//
// class Ticket {
//   Ticket({
//     required this.id,
//     required this.transportationRef,
//     required this.image,
//     required this.name,
//     required this.deleted,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });
//
//   String id;
//   String transportationRef;
//   String image;
//   String name;
//   bool deleted;
//   String createdAt;
//   String updatedAt;
//   int v;
//
//   factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
//         id: json["_id"] ?? "",
//         transportationRef: json["transportationRef"] ?? "",
//         image: json["image"] ?? "",
//         name: json["name"] ?? "",
//         deleted: json["deleted"] ?? false,
//         createdAt: json["createdAt"] ?? "",
//         updatedAt: json["updatedAt"] ?? "",
//         v: json["__v"] ?? 0,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "transportationRef": transportationRef,
//         "image": image,
//         "name": name,
//         "deleted": deleted,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "__v": v,
//       };
// }
