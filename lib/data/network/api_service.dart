import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:find_scan_return_app/app/app_constants.dart';
import 'package:find_scan_return_app/data/models/authentication_model.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/domain/entities/register.dart';
import '../../domain/entities/sign_in.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Authentication?> signIn(SignIn signIn) async {
    try {
      final response = await dio.post('${AppConstants.devBaseURL}/auth/login',
          data: signIn.toJson());

      if (response.statusCode == 200) {
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
}