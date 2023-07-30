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

  Register({
    required this.username,
    required this.email,
    required this.password,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}
