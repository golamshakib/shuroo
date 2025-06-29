// To parse this JSON data, do
//
//     final userInformation = userInformationFromJson(jsonString);

import 'dart:convert';

UserInformation userInformationFromJson(String str) => UserInformation.fromJson(json.decode(str));

String userInformationToJson(UserInformation data) => json.encode(data.toJson());

class UserInformation {
    bool success;
    String message;
    UserInformationData data;

    UserInformation({
        required this.success,
        required this.message,
        required this.data,
    });

    factory UserInformation.fromJson(Map<String, dynamic> json) => UserInformation(
        success: json["success"],
        message: json["message"],
        data: UserInformationData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class UserInformationData {
    String type;
    PostClass data;

    UserInformationData({
        required this.type,
        required this.data,
    });

    factory UserInformationData.fromJson(Map<String, dynamic> json) => UserInformationData(
        type: json["type"],
        data: PostClass.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "data": data.toJson(),
    };
}

class PostClass {
    String id;
    String userId;
    String? postId;
    String content;
    DateTime createdAt;
    DateTime updatedAt;
    User user;
    PostClass? post;
    List<String>? image;

    PostClass({
        required this.id,
        required this.userId,
        this.postId,
        required this.content,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
        this.post,
        this.image,
    });

    factory PostClass.fromJson(Map<String, dynamic> json) => PostClass(
        id: json["id"],
        userId: json["userId"],
        postId: json["postId"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        user: User.fromJson(json["user"]),
        post: json["post"] == null ? null : PostClass.fromJson(json["post"]),
        image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "postId": postId,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "post": post?.toJson(),
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
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
