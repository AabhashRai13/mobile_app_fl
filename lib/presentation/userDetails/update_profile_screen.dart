import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/presentation/resources/assets_manager.dart';
import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_app/presentation/userDetails/service/user_service.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  final Authentication? users;
  const UpdateProfileScreen({Key? key, this.users}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    userService.initialValue(
        email: widget.users!.email,
        username: widget.users!.username,
        phone: widget.users!.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.editProfile),
      ),
      body: Form(
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenHeight(8)),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            const Image(image: AssetImage(ImageAssets.logo))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: ColorManager.primary),
                      child: const Icon(Icons.camera,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields

              TextFormField(
                controller: userService.usernameEditingController,
                decoration: const InputDecoration(
                    label: Text(AppStrings.enterUserName),
                    prefixIcon: Icon(Icons.person)),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              TextFormField(
                controller: userService.emailEditingController,
                decoration: const InputDecoration(
                    label: Text(AppStrings.enterEmail),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              TextFormField(
                controller: userService.phoneEditingController,
                decoration: const InputDecoration(
                    label: Text(AppStrings.phoneNumberLabe),
                    prefixIcon: Icon(Icons.phone)),
              ),

              const Spacer(),
              // -- Form Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    "tEditProfile",
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),

              // -- Created Date and Delete Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text.rich(
                    TextSpan(
                      text: AppStrings.memberSince,
                      style: TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                            text: "From Sunday bruhhh",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12))
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withOpacity(0.1),
                        elevation: 0,
                        foregroundColor: Colors.red,
                        shape: const StadiumBorder(),
                        side: BorderSide.none),
                    child: const Text(AppStrings.delete),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(40)),
            ],
          ),
        ),
      ),
    );
  }
}
