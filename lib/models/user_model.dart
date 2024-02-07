// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? message;
  final Data? data;

  UserModel({
    this.message,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final String? id;
  final String? mobileNo;
  final bool? isAdmin;
  final int? v;
  final String? aadharNumber;
  final String? address;
  final String? email;
  final String? name;
  final String? panNumber;

  Data({
    this.id,
    this.mobileNo,
    this.isAdmin,
    this.v,
    this.aadharNumber,
    this.address,
    this.email,
    this.name,
    this.panNumber,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    mobileNo: json["mobileNo"],
    isAdmin: json["isAdmin"],
    v: json["__v"],
    aadharNumber: json["aadharNumber"],
    address: json["address"],
    email: json["email"],
    name: json["name"],
    panNumber: json["panNumber"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "mobileNo": mobileNo,
    "isAdmin": isAdmin,
    "__v": v,
    "aadharNumber": aadharNumber,
    "address": address,
    "email": email,
    "name": name,
    "panNumber": panNumber,
  };
}
