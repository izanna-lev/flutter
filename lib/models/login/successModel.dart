import 'dart:convert';

SuccessModel successModelFromJson(String str) =>
    SuccessModel.fromJson(json.decode(str));

String successModelToJson(SuccessModel data) => json.encode(data.toJson());

class SuccessModel {
  SuccessModel({
    required this.code,
    required this.message,
    required this.format,
    required this.timestamp,
    required this.data,
  });

  int code;
  String message;
  String format;
  String timestamp;
  String? data;

  factory SuccessModel.fromJson(Map<String, dynamic> json) => SuccessModel(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        format: json["format"] ?? "",
        timestamp: json["timestamp"] ?? "",
        data: json["data"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "format": format,
        "timestamp": timestamp,
        "data": data,
      };
}
