import 'package:find_scan_return_app/presentation/authentication/authentication%20cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'login_form.dart';

class Body extends StatelessWidget {
  final AuthenticationCubit authenticationCubit;
  const Body({super.key, required this.authenticationCubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 6),
      child: const SizedBox(
        width: 320,
        child: LoginForm(),
      ),
    );
  }
}