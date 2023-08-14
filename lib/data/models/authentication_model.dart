import 'package:find_scan_return_app/domain/entities/authentication.dart';

class AuthenticationModel extends Authentication {
  AuthenticationModel(
      {String? username,
      String? email,
      String? password,
      required bool isAdmin,
      required bool isPrinter,
      String? qrId,
      String? id,
      String? createdAt,
      String? updatedAt,
      String? accessToken,
      String? phoneNumber,
      int? v})
      : super(
            updatedAt: updatedAt,
            email: email,
            username: username,
            password: password,
            isAdmin: isAdmin,
            isPrinter: isPrinter,
            qrId: qrId,
            createdAt: createdAt,
            v: v,
            id: id,
            accessToken: accessToken,
            phoneNumber: phoneNumber);
  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        isPrinter: json["isPrinter"],
        qrId: json["qrId"],
        id: json["_id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        accessToken: json["accessToken"],
        phoneNumber: json["phoneNumber"],
        v: json["__v"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "isAdmin": isAdmin,
        "isPrinter": isPrinter,
        "qrId": qrId,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "accessToken": accessToken
      };
}
