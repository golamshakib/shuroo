// To parse this JSON data, do
//
//     final getFavoriteModel = getFavoriteModelFromJson(jsonString);

import 'dart:convert';

GetFavoriteModel getFavoriteModelFromJson(String str) => GetFavoriteModel.fromJson(json.decode(str));

String getFavoriteModelToJson(GetFavoriteModel data) => json.encode(data.toJson());

class GetFavoriteModel {
  bool? success;
  String? message;
  List<Datum>? data;

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
  String? id;
  String? userId;
  String? jobId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Job? job;

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
  String? id;
  String? name;
  String? deadline;
  int? salary;
  String? experience;
  String? location;
  int? vacancy;
  List<String>? mustSkills;
  List<String>? goodSkills;
  String? description;
  String? industryType;
  String? department;
  String? role;
  String? employmentType;
  String? education;
  String? aboutCompany;
  String? companyId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Job({
    this.id,
    this.name,
    this.deadline,
    this.salary,
    this.experience,
    this.location,
    this.vacancy,
    this.mustSkills,
    this.goodSkills,
    this.description,
    this.industryType,
    this.department,
    this.role,
    this.employmentType,
    this.education,
    this.aboutCompany,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    name: json["name"],
    deadline: json["deadline"],
    salary: json["salary"],
    experience: json["experience"],
    location: json["location"],
    vacancy: json["vacancy"],
    mustSkills: json["mustSkills"] == null ? [] : List<String>.from(json["mustSkills"]!.map((x) => x)),
    goodSkills: json["goodSkills"] == null ? [] : List<String>.from(json["goodSkills"]!.map((x) => x)),
    description: json["description"],
    industryType: json["industryType"],
    department: json["department"],
    role: json["role"],
    employmentType: json["employmentType"],
    education: json["education"],
    aboutCompany: json["aboutCompany"],
    companyId: json["companyId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "deadline": deadline,
    "salary": salary,
    "experience": experience,
    "location": location,
    "vacancy": vacancy,
    "mustSkills": mustSkills == null ? [] : List<dynamic>.from(mustSkills!.map((x) => x)),
    "goodSkills": goodSkills == null ? [] : List<dynamic>.from(goodSkills!.map((x) => x)),
    "description": description,
    "industryType": industryType,
    "department": department,
    "role": role,
    "employmentType": employmentType,
    "education": education,
    "aboutCompany": aboutCompany,
    "companyId": companyId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
