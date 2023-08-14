import 'package:dartz/dartz.dart';
import 'package:find_scan_return_app/app/error/failures.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, Authentication>> signIn(
      {String userName, String password});

  Future<Either<Failure, Authentication>> signUp(
      {String email,
      String password,
      String userName,
      String phoneNumber,
      String qrId});
  Future<void> signOut();

  Future<bool> isSignedIn();
}
