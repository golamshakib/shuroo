// To parse this JSON data, do
//
//     final getPostCommentModel = getPostCommentModelFromJson(jsonString);

import 'dart:convert';

GetPostCommentModel getPostCommentModelFromJson(String str) => GetPostCommentModel.fromJson(json.decode(str));

String getPostCommentModelToJson(GetPostCommentModel data) => json.encode(data.toJson());

class GetPostCommentModel {
  bool? success;
  String? message;
  List<Nifat>? data;

  GetPostCommentModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetPostCommentModel.fromJson(Map<String, dynamic> json) => GetPostCommentModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Nifat>.from(json["data"]!.map((x) => Nifat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Nifat {
  String? id;
  String? userId;
  User? user;
  String? postId;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? like;
  Count? count;
  List<ReplyComment>? replyComment;

  Nifat({
    this.id,
    this.userId,
    this.user,
    this.postId,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.like,
    this.count,
    this.replyComment,
  });

  factory Nifat.fromJson(Map<String, dynamic> json) => Nifat(
    id: json["id"],
    userId: json["userId"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    postId: json["postId"],
    comment: json["comment"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    like: json["Like"] == null ? [] : List<dynamic>.from(json["Like"]!.map((x) => x)),
    count: json["_count"] == null ? null : Count.fromJson(json["_count"]),
    replyComment: json["ReplyComment"] == null ? [] : List<ReplyComment>.from(json["ReplyComment"]!.map((x) => ReplyComment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "user": user?.toJson(),
    "postId": postId,
    "comment": comment,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "Like": like == null ? [] : List<dynamic>.from(like!.map((x) => x)),
    "_count": count?.toJson(),
    "ReplyComment": replyComment == null ? [] : List<dynamic>.from(replyComment!.map((x) => x.toJson())),
  };
}

class Count {
  int? replyComment;
  int? like;

  Count({
    this.replyComment,
    this.like,
  });

  factory Count.fromJson(Map<String, dynamic> json) => Count(
    replyComment: json["ReplyComment"],
    like: json["Like"],
  );

  Map<String, dynamic> toJson() => {
    "ReplyComment": replyComment,
    "Like": like,
  };
}

class ReplyComment {
  String? id;
  String? userId;
  User? user;
  String? commentId;
  String? replyComment;
  DateTime? createdAt;
  DateTime? updatedAt;

  ReplyComment({
    this.id,
    this.userId,
    this.user,
    this.commentId,
    this.replyComment,
    this.createdAt,
    this.updatedAt,
  });

  factory ReplyComment.fromJson(Map<String, dynamic> json) => ReplyComment(
    id: json["id"],
    userId: json["userId"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    commentId: json["commentId"],
    replyComment: json["replyComment"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "user": user?.toJson(),
    "commentId": commentId,
    "replyComment": replyComment,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class User {
  String? id;
  String? name;
  dynamic image;

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
