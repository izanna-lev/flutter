import 'dart:convert';

AppDetailModel appDetailModelFromJson(String str) =>
    AppDetailModel.fromJson(json.decode(str));

String appDetailListModelToJson(AppDetailModel data) =>
    json.encode(data.toJson());

class AppDetailModel {
  AppDetailModel({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  AppDetailDataModel data;

  factory AppDetailModel.fromJson(Map<String, dynamic> json) => AppDetailModel(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        data: AppDetailDataModel.fromJson(json["data"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class AppDetailDataModel {
  AppDetailDataModel({
    required this.id,
    required this.aboutUs,
    required this.privacyPolicy,
    required this.termsAndConditions,
    required this.cancellationPolicy,
    // required this.cancellationPolicyUpdatedOn,
    // required this.aboutUsUpdatedOn,
    // required this.createdOn,
    // required this.termsAndConditionsUpdatedOn,
    // required this.privacyPolicyUpdatedOn,
  });

  String id;
  String aboutUs;
  String privacyPolicy;
  String termsAndConditions;
  String cancellationPolicy;
  // DateTime cancellationPolicyUpdatedOn;
  // DateTime termsAndConditionsUpdatedOn;
  // DateTime privacyPolicyUpdatedOn;
  // DateTime aboutUsUpdatedOn;
  // DateTime createdOn;

  factory AppDetailDataModel.fromJson(Map<String, dynamic> json) =>
      AppDetailDataModel(
        id: json["_id"],
        aboutUs: json["aboutUs"],
        privacyPolicy: json["privacyPolicy"],
        termsAndConditions: json["termsAndConditions"],
        cancellationPolicy: json["cancellationPolicy"],
        // cancellationPolicyUpdatedOn:
        //     DateTime.parse(json["cancellationPolicyUpdatedOn"]),
        // aboutUsUpdatedOn: DateTime.parse(json["aboutUsUpdatedOn"]),
        // createdOn: DateTime.parse(json["createdOn"]),
        // termsAndConditionsUpdatedOn:
        // DateTime.parse(json["termsAndConditionsUpdatedOn"]),
        // privacyPolicyUpdatedOn: DateTime.parse(json["privacyPolicyUpdatedOn"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "aboutUs": aboutUs,
        "privacyPolicy": privacyPolicy,
        "termsAndConditions": termsAndConditions,
        "cancellationPolicy": cancellationPolicy,
        // "cancellationPolicyUpdatedOn":
        //     cancellationPolicyUpdatedOn.toIso8601String(),
        // "aboutUsUpdatedOn": aboutUsUpdatedOn.toIso8601String(),
        // "createdOn": createdOn.toIso8601String(),
        // "termsAndConditionsUpdatedOn":
        //     termsAndConditionsUpdatedOn.toIso8601String(),
        // "privacyPolicyUpdatedOn": privacyPolicyUpdatedOn.toIso8601String(),
      };
}

// class AppDetailDataModel {
//   AppDetailDataModel({
//     required this.id,
//     required this.aboutUs,
//     required this.privacyPolicy,
//     required this.termsAndConditions,
//   });
//
//   String id;
//   String aboutUs;
//   String privacyPolicy;
//   String termsAndConditions;
//
//   factory AppDetailDataModel.fromJson(Map<String, dynamic> json) =>
//       AppDetailDataModel(
//         id: json["_id"] ?? "",
//         aboutUs: json["aboutUs"] ?? "",
//         privacyPolicy: json["privacyPolicy"] ?? "",
//         termsAndConditions: json["termsAndConditions"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "aboutUs": aboutUs,
//         "privacyPolicy": privacyPolicy,
//         "termsAndConditions": termsAndConditions,
//       };
// }
