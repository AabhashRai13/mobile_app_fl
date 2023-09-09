import 'package:find_scan_return_app/presentation/resources/assets_manager.dart';
import 'package:find_scan_return_app/presentation/resources/color_manager.dart';
import 'package:find_scan_return_app/presentation/resources/size_config.dart';
import 'package:find_scan_return_app/presentation/splashScreen/services/splash_screen_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SplashScreenServices splashService = SplashScreenServices();
  @override
  void initState() {
    super.initState();

    splashService.firstTimeCheck(context);
  }

  @override
  void dispose() {
    splashService.disposeTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(ImageAssets.logoSvg,
                semanticsLabel: 'Acme Logo'),
          ),
          SizedBox(
            height: getProportionateScreenHeight(100),
          ),
          Center(
              child: LoadingAnimationWidget.discreteCircle(
            color: ColorManager.primary,
            size: getProportionateScreenWidth(40),
          ))
        ],
      ),
    );
  }
}
