import 'package:flutter/material.dart';

class UserService {
  final TextEditingController usernameEditingController =
      TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();

  void initialValue({String? username, String? email, String? phone}) {
    usernameEditingController.text = username!;
    emailEditingController.text = email!;
    phoneEditingController.text = phone!;
  }
}
