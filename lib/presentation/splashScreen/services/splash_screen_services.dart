import 'dart:async';
import 'dart:developer';

import 'package:find_scan_return_app/app/di.dart';
import 'package:find_scan_return_app/app/preferences/secured_storage_manager.dart';
import 'package:find_scan_return_app/app/preferences/shared_preferences_manager.dart';
import 'package:find_scan_return_app/presentation/resources/router/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenServices {
  final SharedPreferencesManager sharedPreferencesManager =
      sl<SharedPreferencesManager>();
  final SecuredStorageManager securedStorageManager = SecuredStorageManager();
  String? token;

  setToken() async {
    token = await securedStorageManager.readAuthToken();
  }

  firstTimeCheck() async {
    bool? isFirstTime = await sharedPreferencesManager.isfirstTime();
    log("is first time $isFirstTime");
    if (isFirstTime ?? true) {
      await securedStorageManager.deleteSecureData();

      sharedPreferencesManager.setfirstTime();
    }
  }

  Timer? _timer;

  /// function to start timer for splash screen to display
  startDelay(BuildContext context) {
    _timer = Timer(const Duration(milliseconds: 10), () {
      _goNext(context);
    });
  }

  /// function to check if token is empty and navigate accordingly
  _goNext(BuildContext context) {
    if (token == null) {
      log("is null");
      if (context.mounted) context.goNamed(Routes.initialScreenRoute);
    } else {
      log("is not null");
      if (context.mounted) context.goNamed(Routes.home);
    }
  }

  disposeTimer() {
    _timer!.cancel();
  }
}
