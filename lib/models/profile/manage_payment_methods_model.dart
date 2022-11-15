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
  CardData data;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        code: json["code"],
        message: json["message"],
        data: CardData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class CardData {
  CardData({
    required this.userRef,
    required this.lastDigitsOfCard,
    required this.cardType,
    required this.country,
    required this.deleted,
    required this.defaultCard,
    required this.id,
    required this.v,
  });

  String userRef;
  int lastDigitsOfCard;
  String cardType;
  String country;
  bool deleted;
  bool defaultCard;
  String id;
  int v;

  factory CardData.fromJson(Map<String, dynamic> json) => CardData(
        userRef: json["userRef"],
        lastDigitsOfCard: json["lastDigitsOfCard"],
        cardType: json["cardType"],
        country: json["country"],
        deleted: json["deleted"],
        defaultCard: json["defaultCard"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "userRef": userRef,
        "lastDigitsOfCard": lastDigitsOfCard,
        "cardType": cardType,
        "country": country,
        "deleted": deleted,
        "defaultCard": defaultCard,
        "_id": id,
        "__v": v,
      };
}
