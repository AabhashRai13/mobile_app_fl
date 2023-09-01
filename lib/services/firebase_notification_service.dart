import 'dart:convert';
import 'dart:developer';
import 'package:find_scan_return_app/app/preferences/shared_preferences_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../presentation/resources/router/routes.dart';
import '../presentation/resources/router/routes_manager.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log('Title: ${message.notification!.title}');
  log('Title: ${message.notification!.body}');
  log('Title: ${message.data}');
  AppRouter.router.goNamed(Routes.home, pathParameters: {'id1': "1"});
}

class FirebaseNotification {
  FirebaseNotification();

  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'This channel is used for important notifications',
      importance: Importance.defaultImportance);

  final _localNotifications = FlutterLocalNotificationsPlugin();
  final SharedPreferencesManager _sharedPreferencesManager =
      SharedPreferencesManager();

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    //// different isLoggedIn function is used here because secured storge can't be used here
    /// as secure storage saves data even if app is uninstalled
    bool? isLoggedIn =
        _sharedPreferencesManager.getBool(SharedPreferencesManager.keyIsLogin);
    if (isLoggedIn == null || !isLoggedIn) {
      return;
    }
    final fCMToken = await _firebaseMessaging.getToken();
    log('FCM Token: $fCMToken');
    initPushNotification();
    initLocalNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    log("-------- Handle Message ---------");
    AppRouter.router.goNamed(Routes.home,
        pathParameters: {'id1': "1", 'id2': message.data.toString()});
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawable/logo',
          )),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/logo');
    const settings = InitializationSettings(
      android: android,
      iOS: iOS,
    );
    await _localNotifications.initialize(settings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      final message = RemoteMessage.fromMap(jsonDecode(payload!));
      handleMessage(message);
      final platform =
          _localNotifications.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      await platform?.createNotificationChannel(_androidChannel);
    }
  }
}
