import 'dart:convert';

AddCardDetail addCardDetailFromJson(String str) =>
    AddCardDetail.fromJson(json.decode(str));

String addCardDetailToJson(AddCardDetail data) => json.encode(data.toJson());

class AddCardDetail {
  AddCardDetail({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  AddCardDetailData data;

  factory AddCardDetail.fromJson(Map<String, dynamic> json) => AddCardDetail(
        code: json["code"],
        message: json["message"],
        data: AddCardDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class AddCardDetailData {
  AddCardDetailData({
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

  factory AddCardDetailData.fromJson(Map<String, dynamic> json) =>
      AddCardDetailData(
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
