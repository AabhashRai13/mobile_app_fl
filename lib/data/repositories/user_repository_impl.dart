import 'package:dartz/dartz.dart';
import 'package:find_scan_return_app/app/error/exceptions.dart';
import 'package:find_scan_return_app/app/error/failures.dart';
import 'package:find_scan_return_app/app/network/network_info.dart';
import 'package:find_scan_return_app/app/preferences/secured_storage_manager.dart';
import 'package:find_scan_return_app/app/preferences/shared_preferences_manager.dart';
import 'package:find_scan_return_app/data/network/api_service.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/domain/repositories/user_repository.dart';

class UserRepositoryImplementation extends UserRepository {
  final NetworkInfo networkInfo;
  final SecuredStorageManager securedStorageManager = SecuredStorageManager();
  final ApiService apiService = ApiService();
  final SharedPreferencesManager sharedPreferencesManager;
  UserRepositoryImplementation(this.networkInfo, this.sharedPreferencesManager);

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Authentication>> getUser() async {
    bool connection = await networkInfo.isConnected();
    if (connection) {
      try {
        String? token = await securedStorageManager.readAuthToken();
        String? userId = sharedPreferencesManager.getString("userID");
        final result = await apiService.getUser(token!, userId!);

        if (result != null) {
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
  Future<Either<Failure, Authentication>> updateUser(
      Authentication user) async {
    bool connection = await networkInfo.isConnected();
    if (connection) {
      try {
        String? token = await securedStorageManager.readAuthToken();
        String? userId = sharedPreferencesManager.getString("userID");
        final result = await apiService.updateUser(token!, userId!, user);

        if (result != null) {
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
}
