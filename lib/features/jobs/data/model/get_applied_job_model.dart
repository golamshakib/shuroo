// To parse this JSON data, do
//
//     final getAppliedJobModel = getAppliedJobModelFromJson(jsonString);

import 'dart:convert';

GetAppliedJobModel getAppliedJobModelFromJson(String str) => GetAppliedJobModel.fromJson(json.decode(str));

String getAppliedJobModelToJson(GetAppliedJobModel data) => json.encode(data.toJson());

class GetAppliedJobModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  GetAppliedJobModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetAppliedJobModel.fromJson(Map<String, dynamic> json) => GetAppliedJobModel(
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
  final String? userId;
  final String? jobId;
  final String? status;
  final bool? isProfileViewed;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Job? job;

  Datum({
    this.id,
    this.userId,
    this.jobId,
    this.status,
    this.isProfileViewed,
    this.createdAt,
    this.updatedAt,
    this.job,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["userId"],
    jobId: json["jobId"],
    status: json["status"],
    isProfileViewed: json["isProfileViewed"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    job: json["job"] == null ? null : Job.fromJson(json["job"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "jobId": jobId,
    "status": status,
    "isProfileViewed": isProfileViewed,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "job": job?.toJson(),
  };
}

class Job {
  final String? id;
  final String? name;
  final int? salary;
  final Company? company;

  Job({
    this.id,
    this.name,
    this.salary,
    this.company,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    name: json["name"],
    salary: json["salary"],
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "salary": salary,
    "company": company?.toJson(),
  };
}

class Company {
  final String? id;
  final String? name;
  final String? logoImage;

  Company({
    this.id,
    this.name,
    this.logoImage,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    name: json["name"],
    logoImage: json["logoImage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logoImage": logoImage,
  };
}
