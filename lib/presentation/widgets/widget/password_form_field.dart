import 'dart:math';
import 'package:find_scan_return_app/presentation/resources/assets_manager.dart';
import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/di.dart';
import '../../obscure/obscure_cubit.dart';
import '../../resources/strings_manager.dart';
import '../widget/custom_suffix_icon.dart';

class PasswordFormField extends StatelessWidget {
 
  final TextEditingController passwordController;
  PasswordFormField(
      {super.key, required this.passwordController,});
  final ObscureCubit obscureCubit = sl<ObscureCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObscureCubit, ObscureCubitState>(
      bloc: obscureCubit,
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          obscureText: state.obscure,
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.passwordValidationMSg;
            } else if (value.length < 6) {
              return AppStrings.weakPasswordValidationMSg;
            }
            return null;
          },
          decoration: InputDecoration(
            hoverColor: ColorManager.blueBackground,
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
            hintText: AppStrings.enterPassword,
            suffixIcon: CustomSurffixIcon(
              isPhoneNumber: false,
              svgIcon: state.obscure
                  ? ImageAssets.eyeIcon
                  : ImageAssets.eyeClosedIcon,
              function: () {
                log(1);
                obscureCubit.obscureText();
              },
            ),
          ),
        );
      },
    );
  }
}