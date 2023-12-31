import 'package:find_scan_return_app/domain/usecases/sign_out_usecase.dart';
import 'package:find_scan_return_app/presentation/resources/assets_manager.dart';
import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:find_scan_return_app/presentation/resources/router/routes_manager.dart';
import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:find_scan_return_app/presentation/resources/style_constants.dart';
import 'package:find_scan_return_app/presentation/widgets/widget/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/di.dart';
import 'bloc/user_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserBloc userBloc = sl<UserBloc>();
  final SignOutUsecase signOutUsecase = sl<SignOutUsecase>();
  @override
  void initState() {
    super.initState();
    userBloc.add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.profile,
        ),
        actions: [
          IconButton(
              onPressed: () {
                signOutUsecase.call();
                context.goNamed(Routes.initialScreenRoute);
              },
              icon: const Icon(Icons.login_outlined))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Error) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is UserLoaded) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(2),
                    getProportionateScreenHeight(20),
                    getProportionateScreenWidth(2),
                    0),
                child: Column(
                  children: [
                    /// -- IMAGE
                    Stack(
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(150),
                          height: getProportionateScreenWidth(150),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(
                                  image: state.user.imageUrl == null
                                      ? const AssetImage(ImageAssets.logo)
                                          as ImageProvider
                                      : NetworkImage(
                                          state.user.imageUrl ?? ""))),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(state.user.username ?? "", style: headingStyle),
                    Text(state.user.email ?? "", style: labelStyle),
                    const SizedBox(height: 20),

                    /// -- BUTTON
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          context.pushNamed(Routes.updateUser,
                              extra: state.user);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.secondary,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: Text(AppStrings.editProfile,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenHeight(14))),
                      ),
                    ),
                    const SizedBox(height: 30),

                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                        title: "Information",
                        icon: Icons.info_outlined,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: AppStrings.logOut,
                        icon: Icons.logout,
                        textColor: Colors.red,
                        endIcon: false,
                        onPress: () {
                          signOutUsecase.call();
                          context.goNamed(Routes.initialScreenRoute);
                        }),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}