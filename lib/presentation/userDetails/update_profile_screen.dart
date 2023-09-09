import 'package:find_scan_return_app/app/constants/regx.dart';
import 'package:find_scan_return_app/app/di.dart';
import 'package:find_scan_return_app/app/params/image_upload_params.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_app/presentation/userDetails/bloc/user_bloc.dart';
import 'package:find_scan_return_app/presentation/userDetails/cubit/image_cubit.dart';
import 'package:find_scan_return_app/presentation/userDetails/service/image_selector.dart';
import 'package:find_scan_return_app/presentation/userDetails/service/user_service.dart';
import 'package:find_scan_return_app/presentation/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UpdateProfileScreen extends StatefulWidget {
  final Authentication? users;
  const UpdateProfileScreen({Key? key, this.users}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final UserService userService = UserService();
  final UserBloc _userBloc = sl<UserBloc>();
  final ImageCubit imageCubit = sl<ImageCubit>();

  final ImageSelector _imageSelector = sl<ImageSelector>();
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  void initState() {
    super.initState();
    imageCubit.resetImage();
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
      body: BlocConsumer<UserBloc, UserState>(
        bloc: _userBloc,
        listener: (context, state) {
          if (state is UserUpdated) {
            loading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(AppStrings.userUpdated)),
            );
            _userBloc.add(GetUserEvent());
          } else if (state is Loading) {
            loading = true;
          } else if (state is Error) {
            loading = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else {
            loading = false;
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
              child: ListView(
                children: [
                  // -- IMAGE with ICON
                  Center(
                    child: InkWell(
                      onTap: () => _imageSelector.getImage(),
                      child: Stack(
                        children: [
                          BlocBuilder<ImageCubit, ImageState>(
                            bloc: imageCubit,
                            builder: (context, state) {
                              if (state is ImageUpdated) {
                                return SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.file(
                                          state.imageFile!,
                                          fit: BoxFit.cover,
                                        )));
                              }
                              return SizedBox(
                                width: 120,
                                height: 120,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image(
                                        image: NetworkImage(widget
                                                .users!.imageUrl ??
                                            "https://img.freepik.com/free-vector/digital-technology-background-with-abstract-wave-border_53876-117508.jpg"))),
                              );
                            },
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
                    ),
                  ),
                  const SizedBox(height: 50),

                  // -- Form Fields

                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        AppStrings.cannotBeEmpty;
                      }
                      return null;
                    },
                    controller: userService.usernameEditingController,
                    decoration: const InputDecoration(
                        label: Text(AppStrings.enterUserName),
                        prefixIcon: Icon(Icons.person)),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.emailValidationMSg;
                      } else if (!emailValidatorRegExp.hasMatch(value)) {
                        return AppStrings.emailNotValidValidationMSg;
                      }
                      return null;
                    },
                    controller: userService.emailEditingController,
                    decoration: const InputDecoration(
                        label: Text(AppStrings.enterEmail),
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.phoneValidationMSg;
                      } else if (!phoneValidation.hasMatch(value)) {
                        return AppStrings.emailNotValidValidationMSg;
                      }
                      return null;
                    },
                    controller: userService.phoneEditingController,
                    decoration: const InputDecoration(
                        label: Text(AppStrings.phoneNumberLabe),
                        prefixIcon: Icon(Icons.phone)),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),

                  // -- Form Submit Button
                  DefaultButton(
                    text: AppStrings.updateUser,
                    loading: loading,
                    press: () {
                      if (formKey.currentState!.validate()) {
                        _userBloc.add(UpdateUserEvent(
                            user: Authentication(
                                email: userService.emailEditingController.text,
                                isAdmin: false,
                                isPrinter: false,
                                username:
                                    userService.usernameEditingController.text,
                                phoneNumber:
                                    userService.phoneEditingController.text,
                                updatedAt: DateTime.now().toString()),
                            imageUploadParams: _imageSelector.imageFile == null
                                ? null
                                : ImageUploadParams(
                                    image: _imageSelector.imageName!,
                                    imageFile: _imageSelector.imageFile!)));
                      }
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),

                  // -- Created Date and Delete Button
                  Text.rich(
                    TextSpan(
                      text: AppStrings.memberSince,
                      style: const TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                            text: DateFormat().format(
                                DateTime.parse(widget.users!.createdAt!)),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12))
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
