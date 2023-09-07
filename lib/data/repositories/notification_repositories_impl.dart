import 'package:dartz/dartz.dart';
import 'package:find_scan_return_app/app/error/exceptions.dart';
import 'package:find_scan_return_app/app/error/failures.dart';
import 'package:find_scan_return_app/app/network/network_info.dart';
import 'package:find_scan_return_app/app/preferences/secured_storage_manager.dart';
import 'package:find_scan_return_app/app/preferences/shared_preferences_manager.dart';
import 'package:find_scan_return_app/data/network/api_service.dart';
import 'package:find_scan_return_app/domain/entities/notification.dart';
import 'package:find_scan_return_app/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final NetworkInfo networkInfo;
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService = ApiService();
  final SecuredStorageManager securedStorageManager = SecuredStorageManager();
  
  NotificationRepositoryImpl(this.networkInfo, this.sharedPreferencesManager);
  @override
  Future<Either<Failure, List<Notification>>> getNotifications() async {
    bool connection = await networkInfo.isConnected();
    if (connection) {
      try {
        String? token = await securedStorageManager.readAuthToken();
        String? userId = sharedPreferencesManager.getString("userID");
        final result = await apiService.getNotification(token!, userId!);

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