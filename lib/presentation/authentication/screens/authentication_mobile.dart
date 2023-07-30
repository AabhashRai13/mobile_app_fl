import 'package:find_scan_return_app/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widget/menu_item.dart';
import '../Login screens/login_body.dart';
import '../authentication cubit/authentication_cubit.dart';
import '../register screens/register_body.dart';

class LoginPageMobile extends StatefulWidget {
  final String? from;
  const LoginPageMobile({super.key, this.from});

  @override
  State<LoginPageMobile> createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {
  final AuthenticationCubit authenticationCubit = sl<AuthenticationCubit>();

  @override
  void initState() {
    super.initState();
    if (widget.from == "GenerateOkrButton") {
      authenticationCubit.toogle(false);
    } else if (widget.from == "SignInButton") {
      authenticationCubit.toogle(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        bloc: authenticationCubit,
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8),
            children: [
              Menu(
                authenticationCubit: authenticationCubit,
                isSignIn: state.isSignIn,
              ),
              state.isSignIn
                  ? Body(
                      authenticationCubit: authenticationCubit,
                    )
                  : RegisterBody(
                      authenticationCubit: authenticationCubit,
                    )
            ],
          );
        },
      ),
    );
  }
}

class Menu extends StatelessWidget {
  final bool isSignIn;
  final AuthenticationCubit authenticationCubit;
  const Menu(
      {super.key, required this.authenticationCubit, required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MenuItem(
            title: 'Sign In',
            isActive: isSignIn,
            press: () {
              authenticationCubit.toogle(true);
            },
          ),
          MenuItem(
              title: 'Register',
              isActive: !isSignIn,
              press: () {
                authenticationCubit.toogle(false);
              }),
        ],
      ),
    );
  }
}