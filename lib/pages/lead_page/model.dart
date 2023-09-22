// To parse this JSON data, do
//
//     final leadResponse = leadResponseFromJson(jsonString);

import 'dart:convert';

LeadResponse leadResponseFromJson(String str) => LeadResponse.fromJson(json.decode(str));

String leadResponseToJson(LeadResponse data) => json.encode(data.toJson());

class LeadResponse {
  bool? status;
  String? message;
  Data? data;

  LeadResponse({
    this.status,
    this.message,
    this.data,
  });

  factory LeadResponse.fromJson(Map<String, dynamic> json) => LeadResponse(
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
  dynamic lead;

  Data({
    this.lead,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lead: json["lead"],
      );

  Map<String, dynamic> toJson() => {
        "lead": lead,
      };
}
