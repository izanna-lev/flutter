import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
  CardModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<CardListData> data;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        code: json["code"],
        message: json["message"],
        data: List<CardListData>.from(
            json["data"].map((x) => CardListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CardListData {
  CardListData(
      {required this.id,
      required this.userRef,
      required this.lastDigitsOfCard,
      required this.cardType,
      required this.stripeCustomerId,
      required this.country,
      required this.deleted,
      required this.defaultCard,
      required this.v,
      required this.selectedCard});

  String id;
  String userRef;
  int lastDigitsOfCard;
  String cardType;
  String stripeCustomerId;
  String country;
  bool deleted;
  bool defaultCard;
  int v;
  bool selectedCard;

  factory CardListData.fromJson(Map<String, dynamic> json) => CardListData(
        id: json["_id"] ?? "",
        userRef: json["userRef"] ?? "",
        lastDigitsOfCard: json["lastDigitsOfCard"] ?? 0,
        cardType: json["cardType"] ?? "",
        stripeCustomerId: json["stripeCustomerId"] ?? "",
        country: json["country"] ?? "",
        deleted: json["deleted"] ?? false,
        defaultCard: json["defaultCard"] ?? false,
        selectedCard: json["selectedCard"] ?? false,
        v: json["__v"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userRef": userRef,
        "lastDigitsOfCard": lastDigitsOfCard,
        "cardType": cardType,
        "stripeCustomerId": stripeCustomerId,
        "country": country,
        "deleted": deleted,
        "defaultCard": defaultCard,
        "__v": v,
        "selectedCard": selectedCard,
      };
}

// import 'dart:convert';
//
// CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));
//
// String cardModelToJson(CardModel data) => json.encode(data.toJson());
//
// class CardModel {
//   CardModel({
//     required this.code,
//     required this.message,
//     required this.data,
//   });
//
//   int code;
//   String message;
//   CardData data;
//
//   factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
//         code: json["code"],
//         message: json["message"],
//         data: CardData.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//         "data": data.toJson(),
//       };
// }
//
// class CardData {
//   CardData({
//     required this.userRef,
//     required this.lastDigitsOfCard,
//     required this.cardType,
//     required this.country,
//     required this.deleted,
//     required this.defaultCard,
//     required this.id,
//     required this.v,
//   });
//
//   String userRef;
//   int lastDigitsOfCard;
//   String cardType;
//   String country;
//   bool deleted;
//   bool defaultCard;
//   String id;
//   int v;
//
//   factory CardData.fromJson(Map<String, dynamic> json) => CardData(
//         userRef: json["userRef"] ?? "",
//         lastDigitsOfCard: json["lastDigitsOfCard"] ?? 0,
//         cardType: json["cardType"] ?? "",
//         country: json["country"] ?? "",
//         deleted: json["deleted"] ?? false,
//         defaultCard: json["defaultCard"] ?? false,
//         id: json["_id"] ?? "",
//         v: json["__v"] ?? 0,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "userRef": userRef,
//         "lastDigitsOfCard": lastDigitsOfCard,
//         "cardType": cardType,
//         "country": country,
//         "deleted": deleted,
//         "defaultCard": defaultCard,
//         "_id": id,
//         "__v": v,
//       };
// }
