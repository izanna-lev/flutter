
import 'dart:convert';

GetChannelModel getChannelModelFromJson(String str) =>
    GetChannelModel.fromJson(json.decode(str));

String getChannelModelToJson(GetChannelModel data) =>
    json.encode(data.toJson());

class GetChannelModel {
  GetChannelModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  GetChannelModelId data;

  factory GetChannelModel.fromJson(Map<String, dynamic> json) =>
      GetChannelModel(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: GetChannelModelId.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class GetChannelModelId {
  GetChannelModelId({
    required this.channelId,
  });

  String channelId;

  factory GetChannelModelId.fromJson(Map<String, dynamic> json) =>
      GetChannelModelId(
        channelId: json["channelId"],
      );

  Map<String, dynamic> toJson() => {
        "channelId": channelId,
      };
}
