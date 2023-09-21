// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  bool? status;
  String? message;
  Data? data;

  RegisterResponse({
    this.status,
    this.message,
    this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? userToken;
  User? user;

  Data({
    this.userToken,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userToken: json["user_token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user_token": userToken,
        "user": user?.toJson(),
      };
}

class User {
  int? userId;
  String? fullName;
  String? cmpName;
  String? userName;
  dynamic profileImage;
  int? contactNo;
  int? roleId;
  dynamic status;
  int? cmpId;
  String? cmpLogo;
  String? password;
  int? deleteData;

  User({
    this.userId,
    this.fullName,
    this.cmpName,
    this.userName,
    this.profileImage,
    this.contactNo,
    this.roleId,
    this.status,
    this.cmpId,
    this.cmpLogo,
    this.password,
    this.deleteData,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        fullName: json["full_name"],
        cmpName: json["cmpName"],
        userName: json["user_name"],
        profileImage: json["profile_image"],
        contactNo: json["contactNo"],
        roleId: json["role_id"],
        status: json["status"],
        cmpId: json["cmp_id"],
        cmpLogo: json["cmp_logo"],
        password: json["password"],
        deleteData: json["delete_data"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "full_name": fullName,
        "cmpName": cmpName,
        "user_name": userName,
        "profile_image": profileImage,
        "contactNo": contactNo,
        "role_id": roleId,
        "status": status,
        "cmp_id": cmpId,
        "cmp_logo": cmpLogo,
        "password": password,
        "delete_data": deleteData,
      };
}
