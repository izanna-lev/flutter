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
        dates:
            List<DateTime>.from((json["dates"]).map((x) => DateTime.parse(x))),
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
    required this.transportDuration,
    required this.userCarDetails,
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
  String transportDuration;
  UserCarDetails? userCarDetails;

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
        transportDuration: json["transportDuration"] ?? "",
        userCarDetails: json["userCarDetails"] == null
            ? null
            : UserCarDetails.fromJson(json["userCarDetails"]),
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
        "transportDuration": transportDuration,
        "userCarDetails": userCarDetails,
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
