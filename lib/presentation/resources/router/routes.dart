import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/presentation/authentication/Login%20screens/login_body.dart';
import 'package:find_scan_return_app/presentation/authentication/register%20screens/register_body.dart';
import 'package:find_scan_return_app/presentation/authentication/screens/authentication_mobile.dart';
import 'package:find_scan_return_app/presentation/home/screens/home.dart';
import 'package:find_scan_return_app/presentation/qrVerification/qr_verification.dart';
import 'package:find_scan_return_app/presentation/qrcode/screens/qr_view.dart';
import 'package:find_scan_return_app/presentation/resources/router/routes_manager.dart';
import 'package:find_scan_return_app/presentation/splashScreen/screen/splash_screen.dart';
import 'package:find_scan_return_app/presentation/userDetails/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/not_found_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        name: Routes.splash,
        builder: (BuildContext context, state) => const Splash(),
      ),
      GoRoute(
          path: Routes.initialScreenRoute,
          name: Routes.initialScreenRoute,
          builder: (BuildContext context, state) => const LoginPageMobile(),
          routes: [
            GoRoute(
              path: Routes.signIn,
              name: Routes.signIn,
              builder: (BuildContext context, state) => const LoginBody(),
            ),
            GoRoute(
                path: Routes.qrScanner,
                name: Routes.qrScanner,
                builder: (BuildContext context, state) =>
                    const QRCodeScanerView(),
                routes: [
                  GoRoute(
                      path: Routes.qrCodeVerificationScreen,
                      name: Routes.qrCodeVerificationScreen,
                      builder: (BuildContext context, state) =>
                          const QrCodeVerification(),
                      routes: [
                        GoRoute(
                          path: Routes.signUp,
                          name: Routes.signUp,
                          builder: (BuildContext context, state) =>
                              const RegisterBody(),
                        ),
                      ]),
                ]),
          ]),
      GoRoute(
          path: Routes.home,
          name: Routes.home,
          builder: (BuildContext context, state) => const Home(),
          routes: [
            GoRoute(
                path: Routes.updateUser,
                name: Routes.updateUser,
                builder: (BuildContext context, state) {
                  Authentication user = state.extra as Authentication;
                  return UpdateProfileScreen(
                    users: user,
                  );
                }),
          ]),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
    // redirect: (context, state) {
    //   return redirect(context, state);
    // },
  );

  static Future<String?> homeRedirect(BuildContext context, state) async {
    return null;
  }

  static GoRouter get router => _router;
}