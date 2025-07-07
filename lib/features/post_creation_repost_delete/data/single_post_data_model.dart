// To parse this JSON data, do
//
//     final singlePostDataModel = singlePostDataModelFromJson(jsonString);

import 'dart:convert';

SinglePostDataModel singlePostDataModelFromJson(String str) => SinglePostDataModel.fromJson(json.decode(str));

String singlePostDataModelToJson(SinglePostDataModel data) => json.encode(data.toJson());

class SinglePostDataModel {
    bool? success;
    String? message;
    SinglePostDataModelData? data;

    SinglePostDataModel({
        this.success,
        this.message,
        this.data,
    });

    factory SinglePostDataModel.fromJson(Map<String, dynamic> json) => SinglePostDataModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : SinglePostDataModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class SinglePostDataModelData {
    String? type;
    DataData? data;

    SinglePostDataModelData({
        this.type,
        this.data,
    });

    factory SinglePostDataModelData.fromJson(Map<String, dynamic> json) => SinglePostDataModelData(
        type: json["type"],
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "data": data?.toJson(),
    };
}

class DataData {
    String? id;
    String? type;
    String? userId;
    String? content;
    List<dynamic>? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    User? user;
    int? totalLike;
    List<dynamic>? like;
    List<dynamic>? comment;
    Count? count;

    DataData({
        this.id,
        this.type,
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

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["id"],
        type: json["type"],
        userId: json["userId"],
        content: json["content"],
        image: json["image"] == null ? [] : List<dynamic>.from(json["image"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        totalLike: json["totalLike"],
        like: json["Like"] == null ? [] : List<dynamic>.from(json["Like"]!.map((x) => x)),
        comment: json["Comment"] == null ? [] : List<dynamic>.from(json["Comment"]!.map((x) => x)),
        count: json["_count"] == null ? null : Count.fromJson(json["_count"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "userId": userId,
        "content": content,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
        "totalLike": totalLike,
        "Like": like == null ? [] : List<dynamic>.from(like!.map((x) => x)),
        "Comment": comment == null ? [] : List<dynamic>.from(comment!.map((x) => x)),
        "_count": count?.toJson(),
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
    String? role;

    User({
        this.id,
        this.name,
        this.image,
        this.role,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "role": role,
    };
}
