import 'package:dartz/dartz.dart';
import 'package:find_scan_return_app/app/error/exceptions.dart';
import 'package:find_scan_return_app/data/network/api_service.dart';
import 'package:find_scan_return_app/domain/repositories/qrcode_repository.dart';
import '../../app/error/failures.dart';
import '../../app/network/network_info.dart';

class QrCodeRepositoryImpl implements QrCodeRepository {
  final NetworkInfo networkInfo;

 
  final ApiService apiService = ApiService();
  QrCodeRepositoryImpl(this.networkInfo);

  @override
  Future<Either<Failure, bool>> checkQRCode({required int qrCodeId}) async {
    bool connection = await networkInfo.isConnected();
    if (connection) {
      try {
        final result = await apiService.checkQrId(qrCodeId);

        if (result!) {
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