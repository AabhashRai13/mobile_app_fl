import 'package:find_scan_return_app/presentation/splashScreen/services/splash_screen_services.dart';
import 'package:flutter/material.dart';

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
    splashService.firstTimeCheck();
    splashService.startDelay(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
