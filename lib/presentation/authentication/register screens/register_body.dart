import 'package:find_scan_return_app/presentation/authentication/register%20screens/register_form.dart';
import 'package:flutter/material.dart';
import '../authentication cubit/authentication_cubit.dart';

class RegisterBody extends StatelessWidget {
  final AuthenticationCubit authenticationCubit;

  const RegisterBody({super.key, required this.authenticationCubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 6),
      child: const SizedBox(
        width: 320,
        child: RegisterForm(),
      ),
    );
  }
}