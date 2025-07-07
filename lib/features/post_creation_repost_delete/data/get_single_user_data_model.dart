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
    List<dynamic>? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    User? user;
    int? totalLike;
    List<Comment>? like;
    List<Comment>? comment;
    Count? count;

    Datum({
        this.id,
        this.userId,
        this.content,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.totalLike,
        this.like,
        this.comment,
        this.count,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        content: json["content"],
        image: json["image"] == null ? [] : List<dynamic>.from(json["image"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        totalLike: json["totalLike"],
        like: json["Like"] == null ? [] : List<Comment>.from(json["Like"]!.map((x) => Comment.fromJson(x))),
        comment: json["Comment"] == null ? [] : List<Comment>.from(json["Comment"]!.map((x) => Comment.fromJson(x))),
        count: json["_count"] == null ? null : Count.fromJson(json["_count"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "content": content,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
        "totalLike": totalLike,
        "Like": like == null ? [] : List<dynamic>.from(like!.map((x) => x.toJson())),
        "Comment": comment == null ? [] : List<dynamic>.from(comment!.map((x) => x.toJson())),
        "_count": count?.toJson(),
    };
}

class Comment {
    String? userId;

    Comment({
        this.userId,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
    };
}

class Count {
    int? like;
    int? comment;

    Count({
        this.like,
        this.comment,
    });

    factory Count.fromJson(Map<String, dynamic> json) => Count(
        like: json["Like"],
        comment: json["Comment"],
    );

    Map<String, dynamic> toJson() => {
        "Like": like,
        "Comment": comment,
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
