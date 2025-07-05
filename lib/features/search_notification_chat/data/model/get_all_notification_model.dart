// To parse this JSON data, do
//
//     final getAllNotificationModel = getAllNotificationModelFromJson(jsonString);

import 'dart:convert';

GetAllNotificationModel getAllNotificationModelFromJson(String str) => GetAllNotificationModel.fromJson(json.decode(str));

String getAllNotificationModelToJson(GetAllNotificationModel data) => json.encode(data.toJson());

class GetAllNotificationModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  GetAllNotificationModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetAllNotificationModel.fromJson(Map<String, dynamic> json) => GetAllNotificationModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? id;
  final String? receiverId;
  final String? senderId;
  final String? title;
  final String? body;
  final String? jobId;
  final String? commentId;
  final bool? read;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.receiverId,
    this.senderId,
    this.title,
    this.body,
    this.jobId,
    this.commentId,
    this.read,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    receiverId: json["receiverId"],
    senderId: json["senderId"],
    title: json["title"],
    body: json["body"],
    jobId: json["jobId"],
    commentId: json["commentId"],
    read: json["read"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "receiverId": receiverId,
    "senderId": senderId,
    "title": title,
    "body": body,
    "jobId": jobId,
    "commentId": commentId,
    "read": read,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
