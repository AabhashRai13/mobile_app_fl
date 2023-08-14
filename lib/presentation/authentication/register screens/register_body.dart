import 'package:find_scan_return_app/presentation/authentication/register%20screens/register_form.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width / 10),
        child: const RegisterForm(),
      ),
    );
  }
}
