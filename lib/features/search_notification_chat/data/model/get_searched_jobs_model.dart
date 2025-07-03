// To parse this JSON data, do
//
//     final getSearchedJobsModel = getSearchedJobsModelFromJson(jsonString);

import 'dart:convert';

GetSearchedJobsModel getSearchedJobsModelFromJson(String str) => GetSearchedJobsModel.fromJson(json.decode(str));

String getSearchedJobsModelToJson(GetSearchedJobsModel data) => json.encode(data.toJson());

class GetSearchedJobsModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  GetSearchedJobsModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetSearchedJobsModel.fromJson(Map<String, dynamic> json) => GetSearchedJobsModel(
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
  final Deadline? deadline;
  final int? salary;
  final Experience? experience;
  final Location? location;
  final int? vacancy;
  final List<MustSkill>? mustSkills;
  final List<GoodSkill>? goodSkills;
  final String? description;
  final IndustryType? industryType;
  final Department? department;
  final Role? role;
  final EmploymentType? employmentType;
  final Education? education;
  final String? aboutCompany;
  final CompanyId? companyId;
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
    deadline: deadlineValues.map[json["deadline"]]!,
    salary: json["salary"],
    experience: experienceValues.map[json["experience"]]!,
    location: locationValues.map[json["location"]]!,
    vacancy: json["vacancy"],
    mustSkills: json["mustSkills"] == null ? [] : List<MustSkill>.from(json["mustSkills"]!.map((x) => mustSkillValues.map[x]!)),
    goodSkills: json["goodSkills"] == null ? [] : List<GoodSkill>.from(json["goodSkills"]!.map((x) => goodSkillValues.map[x]!)),
    description: json["description"],
    industryType: industryTypeValues.map[json["industryType"]]!,
    department: departmentValues.map[json["department"]]!,
    role: roleValues.map[json["role"]]!,
    employmentType: employmentTypeValues.map[json["employmentType"]]!,
    education: educationValues.map[json["education"]]!,
    aboutCompany: json["aboutCompany"],
    companyId: companyIdValues.map[json["companyId"]]!,
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
    count: json["_count"] == null ? null : Count.fromJson(json["_count"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "deadline": deadlineValues.reverse[deadline],
    "salary": salary,
    "experience": experienceValues.reverse[experience],
    "location": locationValues.reverse[location],
    "vacancy": vacancy,
    "mustSkills": mustSkills == null ? [] : List<dynamic>.from(mustSkills!.map((x) => mustSkillValues.reverse[x])),
    "goodSkills": goodSkills == null ? [] : List<dynamic>.from(goodSkills!.map((x) => goodSkillValues.reverse[x])),
    "description": description,
    "industryType": industryTypeValues.reverse[industryType],
    "department": departmentValues.reverse[department],
    "role": roleValues.reverse[role],
    "employmentType": employmentTypeValues.reverse[employmentType],
    "education": educationValues.reverse[education],
    "aboutCompany": aboutCompany,
    "companyId": companyIdValues.reverse[companyId],
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "company": company?.toJson(),
    "_count": count?.toJson(),
  };
}

class Company {
  final CompanyId? id;
  final Name? name;
  final String? logoImage;

  Company({
    this.id,
    this.name,
    this.logoImage,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: companyIdValues.map[json["id"]]!,
    name: nameValues.map[json["name"]]!,
    logoImage: json["logoImage"],
  );

  Map<String, dynamic> toJson() => {
    "id": companyIdValues.reverse[id],
    "name": nameValues.reverse[name],
    "logoImage": logoImage,
  };
}

enum CompanyId {
  THE_685_CCA32_ADB3_B431_E19_E991_C
}

final companyIdValues = EnumValues({
  "685cca32adb3b431e19e991c": CompanyId.THE_685_CCA32_ADB3_B431_E19_E991_C
});

enum Name {
  CETES
}

final nameValues = EnumValues({
  "cetes": Name.CETES
});

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

enum Deadline {
  THE_15_MAY_2025
}

final deadlineValues = EnumValues({
  "15 May 2025": Deadline.THE_15_MAY_2025
});

enum Department {
  UX_DESIGN_ARCHITECTURE
}

final departmentValues = EnumValues({
  "UX, Design & Architecture": Department.UX_DESIGN_ARCHITECTURE
});

enum Education {
  MS_M_SC_SCIENCE_IN_INTERACTION_DESIGN
}

final educationValues = EnumValues({
  "MS/M.Sc(Science in Interaction Design)": Education.MS_M_SC_SCIENCE_IN_INTERACTION_DESIGN
});

enum EmploymentType {
  FULLTIME,
  PARTTIME
}

final employmentTypeValues = EnumValues({
  "FULLTIME": EmploymentType.FULLTIME,
  "PARTTIME": EmploymentType.PARTTIME
});

enum Experience {
  THE_01_YRS
}

final experienceValues = EnumValues({
  "0-1 yrs": Experience.THE_01_YRS
});

enum GoodSkill {
  DESIGN,
  UI,
  UX
}

final goodSkillValues = EnumValues({
  "Design": GoodSkill.DESIGN,
  "UI": GoodSkill.UI,
  "UX": GoodSkill.UX
});

enum IndustryType {
  UI_UX_UI_DEVELOPMENT
}

final industryTypeValues = EnumValues({
  "UI/UX, UI Development": IndustryType.UI_UX_UI_DEVELOPMENT
});

enum Location {
  PORTLAND_OR
}

final locationValues = EnumValues({
  "Portland, OR": Location.PORTLAND_OR
});

enum MustSkill {
  DEVELOPMENT,
  UI,
  UI_UX
}

final mustSkillValues = EnumValues({
  "Development": MustSkill.DEVELOPMENT,
  "UI": MustSkill.UI,
  "UI/UX": MustSkill.UI_UX
});

enum Role {
  UI_UX_DESIGNER
}

final roleValues = EnumValues({
  "UI/UX Designer": Role.UI_UX_DESIGNER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
