import 'dart:convert';

FaqListModel faqListModelFromJson(String str) =>
    FaqListModel.fromJson(json.decode(str));

String faqListModelToJson(FaqListModel data) => json.encode(data.toJson());

class FaqListModel {
  FaqListModel({
    required this.code,
    required this.message,
    required this.faqsData,
  });

  int code;
  String message;
  FaqsData faqsData;

  factory FaqListModel.fromJson(Map<String, dynamic> json) => FaqListModel(
        code: json["code"] ?? 0,
        message: json["message"] ?? "",
        faqsData: FaqsData.fromJson(json["data"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": faqsData.toJson(),
      };
}

class FaqsData {
  FaqsData({
    required this.list,
    required this.total,
    required this.page,
    required this.limit,
    required this.size,
    required this.hasMore,
  });

  List<ListElement> list;
  int total;
  int page;
  int limit;
  int size;
  bool hasMore;

  factory FaqsData.fromJson(Map<String, dynamic> json) => FaqsData(
        list: List<ListElement>.from(
            (json["list"] ?? []).map((x) => ListElement.fromJson(x))),
        total: json["total"] ?? 0,
        page: json["page"] ?? 0,
        limit: json["limit"] ?? 0,
        size: json["size"] ?? 0,
        hasMore: json["hasMore"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "total": total,
        "page": page,
        "limit": limit,
        "size": size,
        "hasMore": hasMore,
      };
}

class ListElement {
  ListElement({
    required this.deleted,
    required this.id,
    required this.question,
    required this.answer,
  });

  bool deleted;
  String id;
  String question;
  String answer;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        deleted: json["deleted"] ?? false,
        id: json["_id"] ?? "",
        question: json["question"] ?? "",
        answer: json["answer"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "deleted": deleted,
        "_id": id,
        "question": question,
        "answer": answer,
      };
}
