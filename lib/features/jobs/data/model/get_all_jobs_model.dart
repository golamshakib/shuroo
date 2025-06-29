// To parse this JSON data, do
//
//     final getAllJobsModel = getAllJobsModelFromJson(jsonString);

import 'dart:convert';

GetAllJobsModel getAllJobsModelFromJson(String str) => GetAllJobsModel.fromJson(json.decode(str));

String getAllJobsModelToJson(GetAllJobsModel data) => json.encode(data.toJson());

class GetAllJobsModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  GetAllJobsModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetAllJobsModel.fromJson(Map<String, dynamic> json) => GetAllJobsModel(
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
  final String? name;
  final String? deadline;
  final int? salary;
  final String? experience;
  final String? location;
  final int? vacancy;
  final List<String>? mustSkills;
  final List<String>? goodSkills;
  final String? description;
  final String? industryType;
  final String? department;
  final String? role;
  final String? employmentType;
  final String? education;
  final String? aboutCompany;
  final String? companyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Company? company;
  final Count? count;

  Datum({
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
    this.company,
    this.count,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
    count: json["_count"] == null ? null : Count.fromJson(json["_count"]),
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
    "company": company?.toJson(),
    "_count": count?.toJson(),
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

class Count {
  final int? application;

  Count({
    this.application,
  });

  factory Count.fromJson(Map<String, dynamic> json) => Count(
    application: json["Application"],
  );

  Map<String, dynamic> toJson() => {
    "Application": application,
  };
}
