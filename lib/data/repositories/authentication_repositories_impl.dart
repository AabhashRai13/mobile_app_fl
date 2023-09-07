import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:find_scan_return_app/app/preferences/secured_storage_manager.dart';
import 'package:find_scan_return_app/app/preferences/shared_preferences_manager.dart';
import 'package:find_scan_return_app/data/network/api_service.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/domain/entities/register.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../app/error/exceptions.dart';
import '../../app/error/failures.dart';
import '../../app/network/network_info.dart';
import '../../domain/entities/sign_in.dart';
import '../../domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final NetworkInfo networkInfo;
  final _firebaseMessaging = FirebaseMessaging.instance;

  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService = ApiService();
  final SecuredStorageManager securedStorageManager = SecuredStorageManager();
  AuthenticationRepositoryImpl(this.networkInfo, this.sharedPreferencesManager);

  @override
  Future<Either<Failure, Authentication>> signIn(
      {String? userName, String? password}) async {
    bool connection = await networkInfo.isConnected();
    if (connection) {
      final fCMToken = await _firebaseMessaging.getToken();
      try {
        final result = await apiService.signIn(SignIn(
            username: userName!, password: password!, fcmToken: fCMToken));

        if (result != null) {
          sharedPreferencesManager.putBool(
              SharedPreferencesManager.keyIsLogin, true);
          log("----- User Id ${result.id}");
          sharedPreferencesManager.putString(
              SharedPreferencesManager.userId, result.id!);
          securedStorageManager.writeAuthToken(result.accessToken!);
          return Right(result);
        } else {
          return Left(CredentialsFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> signUp(
      {String? email,
      String? password,
      String? userName,
      String? phoneNumber,
      String? qrId}) async {
    bool connection = await networkInfo.isConnected();
    if (connection) {
      final fCMToken = await _firebaseMessaging.getToken();
      try {
        final result = await apiService.registerUser(Register(
            email: email!,
            password: password!,
            username: userName!,
            phoneNumber: phoneNumber!,
            qrId: qrId!,
            fcmToken: fCMToken!));

        if (result!.accessToken != null) {
          sharedPreferencesManager.putBool(
              SharedPreferencesManager.keyIsLogin, true);
          log("----- User Id ${result.id}");
          sharedPreferencesManager.putString(
              SharedPreferencesManager.userId, result.id!);
          securedStorageManager.writeAuthToken(result.accessToken!);
          return Right(result);
        } else {
          return Left(CredentialsFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<void> signOut() async {
    sharedPreferencesManager.clearAll();
    securedStorageManager.deleteSecureData();
  }

  @override
  Future<bool> isSignedIn() async {
    String? token = await securedStorageManager.readAuthToken();
    if (token != null) {
      return true;
    }
    return false;
  }
}