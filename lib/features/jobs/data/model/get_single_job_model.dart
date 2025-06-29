// To parse this JSON data, do
//
//     final getSingleJobModel = getSingleJobModelFromJson(jsonString);

import 'dart:convert';

GetSingleJobModel getSingleJobModelFromJson(String str) => GetSingleJobModel.fromJson(json.decode(str));

String getSingleJobModelToJson(GetSingleJobModel data) => json.encode(data.toJson());

class GetSingleJobModel {
  final bool? success;
  final String? message;
  final Data? data;

  GetSingleJobModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetSingleJobModel.fromJson(Map<String, dynamic> json) => GetSingleJobModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
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
  final List<Application>? application;

  Data({
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
    this.application,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    application: json["Application"] == null ? [] : List<Application>.from(json["Application"]!.map((x) => Application.fromJson(x))),
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
    "Application": application == null ? [] : List<dynamic>.from(application!.map((x) => x.toJson())),
  };
}

class Application {
  final String? id;
  final User? user;

  Application({
    this.id,
    this.user,
  });

  factory Application.fromJson(Map<String, dynamic> json) => Application(
    id: json["id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user?.toJson(),
  };
}

class User {
  final String? id;
  final String? name;
  final String? image;

  User({
    this.id,
    this.name,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
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
