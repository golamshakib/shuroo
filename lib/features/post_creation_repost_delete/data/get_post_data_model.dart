// To parse this JSON data, do
//
//     final userInformation = userInformationFromJson(jsonString);

import 'dart:convert';

UserInformation userInformationFromJson(String str) => UserInformation.fromJson(json.decode(str));

String userInformationToJson(UserInformation data) => json.encode(data.toJson());

class UserInformation {
    bool success;
    String message;
    List<Datum> data;

    UserInformation({
        required this.success,
        required this.message,
        required this.data,
    });

    factory UserInformation.fromJson(Map<String, dynamic> json) => UserInformation(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String content;
    List<String> image;
    String userId;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.content,
        required this.image,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        content: json["content"],
        image: List<String>.from(json["image"].map((x) => x)),
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "image": List<dynamic>.from(image.map((x) => x)),
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
