import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<TransactionListModel> data;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: List<TransactionListModel>.from(
            (json["data"] ?? []).map((x) => TransactionListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TransactionListModel {
  TransactionListModel({
    required this.id,
    required this.name,
    required this.price,
    required this.lastDigitsCard,
    required this.transactionType,
    required this.createdOn,
  });

  String id;
  String name;
  double price;
  String lastDigitsCard;
  int transactionType;
  String createdOn;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      TransactionListModel(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        price: json["price"].toDouble() ?? 00.00,
        lastDigitsCard: json["lastDigitsCard"] ?? "",
        transactionType: json["transactionType"] ?? 0,
        createdOn: json["createdOn"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "lastDigitsCard": lastDigitsCard,
        "transactionType": transactionType,
        "createdOn": createdOn,
      };
}
