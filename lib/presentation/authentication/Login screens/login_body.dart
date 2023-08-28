import 'package:find_scan_return_app/presentation/resources/assets_manager.dart';
import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: getProportionateScreenHeight(250),
              child: Image.asset(ImageAssets.logo)),
          Center(
            child: SizedBox(
              width: getProportionateScreenWidth(320),
              child: const LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}
