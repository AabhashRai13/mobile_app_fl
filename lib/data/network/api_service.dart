import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:find_scan_return_app/app/app_constants.dart';
import 'package:find_scan_return_app/app/params/image_upload_params.dart';
import 'package:find_scan_return_app/data/models/authentication_model.dart';
import 'package:find_scan_return_app/data/models/notification_model.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/domain/entities/notification.dart';
import 'package:find_scan_return_app/domain/entities/register.dart';
import '../../domain/entities/sign_in.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Authentication?> signIn(SignIn signIn) async {
    try {
      final response = await dio.post('${AppConstants.devBaseURL}/auth/login',
          data: signIn.toJson());
      log("Fcm Token before login ${signIn.fcmToken}");
      if (response.statusCode == 200) {
        Authentication authentication =
            AuthenticationModel.fromJson(response.data);
        log("Fcm token ${authentication.fcmTokens}");
        return authentication;
      }
      return null;
    } catch (e) {
      log("Error $e");
      return null;
    }
  }

  Future<Authentication?> registerUser(Register registerParam) async {
    try {
      final response = await dio.post(
        '${AppConstants.devBaseURL}/auth/register',
        data: registerParam.toJson(),
      );

      if (response.statusCode == 201) {
        Authentication authentication =
            AuthenticationModel.fromJson(response.data);

        return authentication;
      }
      return null;
    } catch (e) {
      log("Error $e");
      return null;
    }
  }

  Future<bool?> checkQrId(int qrId) async {
    try {
      final response = await dio.get(
        '${AppConstants.devBaseURL}/qrCodes/check/$qrId',
      );

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log("Error $e");
      return false;
    }
  }

  Future<Authentication?> getUser(String accessToken, String userId) async {
    try {
      final response = await dio.get(
        '${AppConstants.devBaseURL}/users/find/$userId',
        options: Options(headers: {
          'token': 'Bearer $accessToken',
        }),
      );

      if (response.statusCode == 200) {
        Authentication users = AuthenticationModel.fromJson(response.data);

        return users;
      }
      return null;
    } catch (e) {
      log("Error $e");
      return null;
    }
  }

  Future<Authentication?> updateUser(
    String accessToken,
    String userId,
    Authentication user,
    ImageUploadParams? imageUploadParams,
  ) async {
    log("---image file----");
    if (imageUploadParams != null) {
      log("${imageUploadParams.imageFile}");
    }

    try {
      FormData? formData;

      if (imageUploadParams != null) {
        formData = FormData.fromMap(
          {
            "image": await MultipartFile.fromFile(
              imageUploadParams.imageFile.path,
              filename: imageUploadParams.image,
            ),
            "jsonData": MultipartFile.fromString(
              jsonEncode(user.toJson()),
            ),
          },
        );
      }

      final response = await dio.put('${AppConstants.devBaseURL}/users/$userId',
          options: Options(headers: {
            'token': 'Bearer $accessToken',
          }),
          data: formData ?? user.toJson());

      if (response.statusCode == 200) {
        Authentication users = AuthenticationModel.fromJson(response.data);

        return users;
      }
      return null;
    } catch (e) {
      log("Error $e");
      return null;
    }
  }

  Future<List<Notification>?> getNotification(
      String accessToken, String userID) async {
    log(accessToken);
    try {
      final response = await dio.get(
          '${AppConstants.devBaseURL}/pushNotification/notification/$userID',
          options: Options(headers: {
            'token': 'Bearer $accessToken',
          }));

      if (response.statusCode == 200) {
        List<Notification> notification = [];

        response.data.forEach((e) {
          notification.add(NotificationModel.fromJson(e));
        });
        return notification;
      }
      return null;
    } catch (e) {
      log("Error $e");
      return null;
    }
  }
}
