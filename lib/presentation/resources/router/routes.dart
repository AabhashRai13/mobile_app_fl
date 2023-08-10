import 'package:find_scan_return_app/presentation/authentication/Login%20screens/login_body.dart';
import 'package:find_scan_return_app/presentation/authentication/screens/authentication_mobile.dart';
import 'package:find_scan_return_app/presentation/qrVerification/qr_verification.dart';
import 'package:find_scan_return_app/presentation/qrcode/screens/qr_view.dart';
import 'package:find_scan_return_app/presentation/resources/router/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/not_found_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.initialScreenRoute,
    routes: [
      GoRoute(
        path: Routes.initialScreenRoute,
        name: Routes.initialScreenRoute,
        builder: (BuildContext context, state) => LoginPageMobile(),
      ),
      GoRoute(
        path: Routes.signIn,
        name: Routes.signIn,
        builder: (BuildContext context, state) => const LoginBody(),
      ),
      GoRoute(
        path: Routes.qrScanner,
        name: Routes.qrScanner,
        builder: (BuildContext context, state) => const QRCodeScanerView(),
      ),
      GoRoute(
        path: Routes.qrCodeVerificationScreen,
        name: Routes.qrCodeVerificationScreen,
        builder: (BuildContext context, state) => const QrCodeVerification(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
    redirect: (context, state) {
      return redirect(context, state);
    },
  );

  static Future<String?> redirect(BuildContext context, state) async {
    return null;
  }

  static Future<String?> homeRedirect(BuildContext context, state) async {
    return null;
  }

  static GoRouter get router => _router;
}
