// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool? status;
  String? message;
  Data? data;

  LoginResponse({
    this.status,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
  String? cmpLogo;
  dynamic profileImage;
  String? fullName;
  String? cmpName;
  int? cmpId;
  int? contactNo;
  String? userName;
  String? password;
  int? roleId;
  int? status;
  String? createdBy;
  DateTime? createdTimeDate;
  dynamic updatedBy;
  dynamic updatedTimeDate;
  int? deleteData;
  int? isTrial;
  DateTime? trialDate;
  String? deviceId;
  String? deviceType;
  String? fcmToken;

  User({
    this.userId,
    this.cmpLogo,
    this.profileImage,
    this.fullName,
    this.cmpName,
    this.cmpId,
    this.contactNo,
    this.userName,
    this.password,
    this.roleId,
    this.status,
    this.createdBy,
    this.createdTimeDate,
    this.updatedBy,
    this.updatedTimeDate,
    this.deleteData,
    this.isTrial,
    this.trialDate,
    this.deviceId,
    this.deviceType,
    this.fcmToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        cmpLogo: json["cmp_logo"],
        profileImage: json["profile_image"],
        fullName: json["full_name"],
        cmpName: json["cmpName"],
        cmpId: json["cmp_id"],
        contactNo: json["contactNo"],
        userName: json["user_name"],
        password: json["password"],
        roleId: json["role_id"],
        status: json["status"],
        createdBy: json["created_by"],
        createdTimeDate: json["created_time_date"] == null
            ? null
            : DateTime.parse(json["created_time_date"]),
        updatedBy: json["updated_by"],
        updatedTimeDate: json["updated_time_date"],
        deleteData: json["delete_data"],
        isTrial: json["is_trial"],
        trialDate: json["trial_date"] == null
            ? null
            : DateTime.parse(json["trial_date"]),
        deviceId: json["device_id"],
        deviceType: json["device_type"],
        fcmToken: json["fcm_token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "cmp_logo": cmpLogo,
        "profile_image": profileImage,
        "full_name": fullName,
        "cmpName": cmpName,
        "cmp_id": cmpId,
        "contactNo": contactNo,
        "user_name": userName,
        "password": password,
        "role_id": roleId,
        "status": status,
        "created_by": createdBy,
        "created_time_date": createdTimeDate?.toIso8601String(),
        "updated_by": updatedBy,
        "updated_time_date": updatedTimeDate,
        "delete_data": deleteData,
        "is_trial": isTrial,
        "trial_date": trialDate?.toIso8601String(),
        "device_id": deviceId,
        "device_type": deviceType,
        "fcm_token": fcmToken,
      };
}
