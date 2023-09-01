import 'dart:convert';

Register registerFromJson(String str) {
  final jsonData = json.decode(str);
  return Register.fromJson(jsonData);
}

String registerToJson(Register data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Register {
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final String qrId;
  final String fcmToken;

  Register(
      {required this.username,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.qrId, 
      required this.fcmToken});

  factory Register.fromJson(Map<String, dynamic> json) => Register(
      username: json["username"],
      email: json["email"],
      password: json["password"],
      phoneNumber: json["phoneNumber"],
      qrId: json["qrId"],
      fcmToken: json["fcmToken"]);

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "phoneNumber": phoneNumber,
        "qrId": qrId,
        "fcmToken": fcmToken
      };
}
