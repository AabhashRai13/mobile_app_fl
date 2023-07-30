import 'package:dartz/dartz.dart';
import 'package:find_scan_return_app/app/preferences/shared_preferences_manager.dart';
import 'package:find_scan_return_app/data/network/api_service.dart';
import 'package:find_scan_return_app/domain/repositories/qrcode_repository.dart';
import '../../app/error/failures.dart';
import '../../app/network/network_info.dart';

class QrCodeRepositoryImpl implements QrCodeRepository {
  final NetworkInfo networkInfo;

  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService = ApiService();
  QrCodeRepositoryImpl(this.networkInfo, this.sharedPreferencesManager);

  @override
  Future<Either<Failure, bool>> checkQRCode({required int numberOfQrCode}) {
    // TODO: implement checkQRCode
    throw UnimplementedError();
  }
}
