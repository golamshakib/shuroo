import 'dart:convert';

GetUser getUserFromJson(String str) => GetUser.fromJson(json.decode(str));

String getUserToJson(GetUser data) => json.encode(data.toJson());

class GetUser {
    bool? success;
    String? message;
    Data? data;

    GetUser({
        this.success,
        this.message,
        this.data,
    });

    factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
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
    String? id;
    String? email;
    String? name;
    String? phone;
    String? role;
    String? password;
    dynamic country;
    dynamic state;
    dynamic city;
    dynamic videoProfile;
    List<dynamic>? skills;
    List<dynamic>? tools;
    List<dynamic>? interests;
    List<dynamic>? languages;
    dynamic companyType;
    dynamic establishmentYear;
    dynamic yearsOfBusinesses;
    dynamic operationCountry;
    dynamic totalEmployees;
    dynamic hiringFromShuroo;
    dynamic about;
    dynamic logoImage;
    dynamic coverImage;
    dynamic fcmToken;
    dynamic image;
    String? status;
    String? customerId;
    dynamic connectAccountId;
    bool? isVerified;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<dynamic>? experience;

    Data({
        this.id,
        this.email,
        this.name,
        this.phone,
        this.role,
        this.password,
        this.country,
        this.state,
        this.city,
        this.videoProfile,
        this.skills,
        this.tools,
        this.interests,
        this.languages,
        this.companyType,
        this.establishmentYear,
        this.yearsOfBusinesses,
        this.operationCountry,
        this.totalEmployees,
        this.hiringFromShuroo,
        this.about,
        this.logoImage,
        this.coverImage,
        this.fcmToken,
        this.image,
        this.status,
        this.customerId,
        this.connectAccountId,
        this.isVerified,
        this.createdAt,
        this.updatedAt,
        this.experience,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        role: json["role"],
        password: json["password"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        videoProfile: json["videoProfile"],
        skills: json["skills"] == null ? [] : List<dynamic>.from(json["skills"]!.map((x) => x)),
        tools: json["tools"] == null ? [] : List<dynamic>.from(json["tools"]!.map((x) => x)),
        interests: json["interests"] == null ? [] : List<dynamic>.from(json["interests"]!.map((x) => x)),
        languages: json["languages"] == null ? [] : List<dynamic>.from(json["languages"]!.map((x) => x)),
        companyType: json["companyType"],
        establishmentYear: json["establishmentYear"],
        yearsOfBusinesses: json["yearsOfBusinesses"],
        operationCountry: json["operationCountry"],
        totalEmployees: json["totalEmployees"],
        hiringFromShuroo: json["hiringFromShuroo"],
        about: json["about"],
        logoImage: json["logoImage"],
        coverImage: json["coverImage"],
        fcmToken: json["fcmToken"],
        image: json["image"],
        status: json["status"],
        customerId: json["customerId"],
        connectAccountId: json["connectAccountId"],
        isVerified: json["isVerified"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        experience: json["Experience"] == null ? [] : List<dynamic>.from(json["Experience"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "phone": phone,
        "role": role,
        "password": password,
        "country": country,
        "state": state,
        "city": city,
        "videoProfile": videoProfile,
        "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "tools": tools == null ? [] : List<dynamic>.from(tools!.map((x) => x)),
        "interests": interests == null ? [] : List<dynamic>.from(interests!.map((x) => x)),
        "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x)),
        "companyType": companyType,
        "establishmentYear": establishmentYear,
        "yearsOfBusinesses": yearsOfBusinesses,
        "operationCountry": operationCountry,
        "totalEmployees": totalEmployees,
        "hiringFromShuroo": hiringFromShuroo,
        "about": about,
        "logoImage": logoImage,
        "coverImage": coverImage,
        "fcmToken": fcmToken,
        "image": image,
        "status": status,
        "customerId": customerId,
        "connectAccountId": connectAccountId,
        "isVerified": isVerified,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "Experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x)),
    };
}
