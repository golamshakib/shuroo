// To parse this JSON data, do
//
//     final getUserPost = getUserPostFromJson(jsonString);

import 'dart:convert';

GetUserPost getUserPostFromJson(String str) => GetUserPost.fromJson(json.decode(str));

String getUserPostToJson(GetUserPost data) => json.encode(data.toJson());

class GetUserPost {
    bool success;
    String message;
    Data data;

    GetUserPost({
        required this.success,
        required this.message,
        required this.data,
    });

    factory GetUserPost.fromJson(Map<String, dynamic> json) => GetUserPost(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String type;
    List<Datum> data;

    Data({
        required this.type,
        required this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String userId;
    String content;
    List<String> image;
    DateTime createdAt;
    DateTime updatedAt;
    User user;

    Datum({
        required this.id,
        required this.userId,
        required this.content,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        content: json["content"],
        image: List<String>.from(json["image"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "content": content,
        "image": List<dynamic>.from(image.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "user": user.toJson(),
    };
}

class User {
    String id;
    String name;
    String image;

    User({
        required this.id,
        required this.name,
        required this.image,
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
