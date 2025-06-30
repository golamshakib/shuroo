// To parse this JSON data, do
//
//     final getUser = getUserFromJson(jsonString);

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
    String? country;
    String? state;
    String? city;
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
    String? image;
    String? status;
    String? customerId;
    dynamic connectAccountId;
    bool? isVerified;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Post>? post;
    List<dynamic>? job;

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
        this.post,
        this.job,
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
        post: json["Post"] == null ? [] : List<Post>.from(json["Post"]!.map((x) => Post.fromJson(x))),
        job: json["Job"] == null ? [] : List<dynamic>.from(json["Job"]!.map((x) => x)),
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
        "Post": post == null ? [] : List<dynamic>.from(post!.map((x) => x.toJson())),
        "Job": job == null ? [] : List<dynamic>.from(job!.map((x) => x)),
    };
}

class Post {
    String? id;
    String? content;
    List<String>? image;
    String? userId;
    DateTime? createdAt;
    DateTime? updatedAt;
    User? user;

    Post({
        this.id,
        this.content,
        this.image,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.user,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        content: json["content"],
        image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
        userId: json["userId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
    };
}

class User {
    String? id;
    String? name;
    String? image;
    dynamic logoImage;

    User({
        this.id,
        this.name,
        this.image,
        this.logoImage,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        logoImage: json["logoImage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "logoImage": logoImage,
    };
}
