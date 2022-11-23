import 'dart:convert';

RatingModel ratingModelFromJson(String str) =>
    RatingModel.fromJson(json.decode(str));

String ratingModelToJson(RatingModel data) => json.encode(data.toJson());

class RatingModel {
  RatingModel({
    required this.code,
    required this.message,
    required this.data,
    required this.format,
    required this.timestamp,
  });

  int code;
  String message;
  RatingData data;
  String format;
  DateTime timestamp;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        code: json["code"],
        message: json["message"],
        data: RatingData.fromJson(json["data"]),
        format: json["format"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
        "format": format,
        "timestamp": timestamp.toIso8601String(),
      };
}

class RatingData {
  RatingData({
    required this.rating,
  });

  Rating rating;

  factory RatingData.fromJson(Map<String, dynamic> json) => RatingData(
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating.toJson(),
      };
}

class Rating {
  Rating({
    required this.experience,
    required this.specialist,
    required this.value,
  });

  double experience;
  double specialist;
  double value;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        experience: json["experience"],
        specialist: json["specialist"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "experience": experience,
        "specialist": specialist,
        "value": value,
      };
}
