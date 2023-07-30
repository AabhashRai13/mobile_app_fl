import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../app/constants/regx.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailFormField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.emailValidationMSg;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return AppStrings.emailNotValidValidationMSg;
        }
        return null;
      },
      decoration: InputDecoration(
        hoverColor: ColorManager.blueBackground,
        hintText: AppStrings.enterEmail,
        filled: true,
        fillColor: Colors.blueGrey[50],
        labelStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.only(left: 30),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[50]!),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[50]!),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}