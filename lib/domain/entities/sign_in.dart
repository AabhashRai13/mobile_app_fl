import 'dart:convert';

SignIn signInFromJson(String str) {
  final jsonData = json.decode(str);
  return SignIn.fromJson(jsonData);
}

String signInToJson(SignIn data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class SignIn {
  final String username;
  final String password;
  final String? imei;
  final String? deviceType;
  final String? fcmToken;

  SignIn(
      {required this.username,
      required this.password,
      this.imei,
      this.deviceType,
      this.fcmToken});
  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        username: json["username"],
        password: json["password"],
        fcmToken: json["fcmToken"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "fcmToken": fcmToken,
      };
}
