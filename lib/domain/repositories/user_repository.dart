import 'package:dartz/dartz.dart';
import 'package:find_scan_return_app/app/error/failures.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';

abstract class UserRepository {
  Future<Either<Failure, Authentication>> getUser();
  Future<Either<Failure, Authentication>> updateUser(Authentication user);

  Future<void> deleteUser();
}
