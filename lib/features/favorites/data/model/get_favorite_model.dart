// To parse this JSON data, do
//
//     final getFavoriteModel = getFavoriteModelFromJson(jsonString);

import 'dart:convert';

GetFavoriteModel getFavoriteModelFromJson(String str) => GetFavoriteModel.fromJson(json.decode(str));

String getFavoriteModelToJson(GetFavoriteModel data) => json.encode(data.toJson());

class GetFavoriteModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  GetFavoriteModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetFavoriteModel.fromJson(Map<String, dynamic> json) => GetFavoriteModel(
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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Job? job;

  Datum({
    this.id,
    this.userId,
    this.jobId,
    this.createdAt,
    this.updatedAt,
    this.job,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["userId"],
    jobId: json["jobId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    job: json["job"] == null ? null : Job.fromJson(json["job"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "jobId": jobId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "job": job?.toJson(),
  };
}

class Job {
  final String? id;
  final String? name;
  final int? salary;
  final String? location;
  final String? employmentType;
  final Company? company;

  Job({
    this.id,
    this.name,
    this.salary,
    this.location,
    this.employmentType,
    this.company,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    name: json["name"],
    salary: json["salary"],
    location: json["location"],
    employmentType: json["employmentType"],
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "salary": salary,
    "location": location,
    "employmentType": employmentType,
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
