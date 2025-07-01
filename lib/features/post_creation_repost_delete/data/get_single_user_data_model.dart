// To parse this JSON data, do
//
//     final getSingleUser = getSingleUserFromJson(jsonString);

import 'dart:convert';

GetSingleUser getSingleUserFromJson(String str) => GetSingleUser.fromJson(json.decode(str));

String getSingleUserToJson(GetSingleUser data) => json.encode(data.toJson());

class GetSingleUser {
    bool? success;
    String? message;
    Data? data;

    GetSingleUser({
        this.success,
        this.message,
        this.data,
    });

    factory GetSingleUser.fromJson(Map<String, dynamic> json) => GetSingleUser(
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
    String? type;
    List<Datum>? data;

    Data({
        this.type,
        this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? userId;
    String? content;
    List<String>? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    User? user;

    Datum({
        this.id,
        this.userId,
        this.content,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.user,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        content: json["content"],
        image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "content": content,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
    };
}

class User {
    String? id;
    String? name;
    String? image;

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
