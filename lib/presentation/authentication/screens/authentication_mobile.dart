import 'package:find_scan_return_app/app/di.dart';
import 'package:find_scan_return_app/presentation/resources/assets_manager.dart';
import 'package:find_scan_return_app/presentation/resources/router/routes_manager.dart';
import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_app/presentation/resources/style_constants.dart';
import 'package:find_scan_return_app/presentation/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../authentication cubit/authentication_cubit.dart';

class LoginPageMobile extends StatefulWidget {
  const LoginPageMobile({super.key});

  @override
  State<LoginPageMobile> createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {
  final AuthenticationCubit authenticationCubit = sl<AuthenticationCubit>();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        bloc: authenticationCubit,
        builder: (context, state) {
          return ListView(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: getProportionateScreenHeight(250),
                  child: Image.asset(ImageAssets.logo)),
              const AuthenticationCard()
            ],
          );
        },
      ),
    );
  }
}

class AuthenticationCard extends StatelessWidget {
  const AuthenticationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: getProportionateScreenHeight(300),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: Text(
                  AppStrings.alreadyAccount,
                  style: labelStyle,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              DefaultButton(
                loading: false,
                width: MediaQuery.sizeOf(context).width * 0.7,
                text: AppStrings.loginText,
                press: () {
                  context.pushNamed(Routes.signIn);
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: Text(
                  AppStrings.newAccount,
                  style: labelStyle,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              DefaultButton(
                width: MediaQuery.sizeOf(context).width * 0.7,
                loading: false,
                text: AppStrings.scanQr,
                press: () {
                  context.goNamed(Routes.qrScanner);
                },
              ),
            ]),
      ),
    );
  }
}
