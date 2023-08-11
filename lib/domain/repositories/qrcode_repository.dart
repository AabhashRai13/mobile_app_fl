import 'package:dartz/dartz.dart';
import 'package:find_scan_return_app/app/error/failures.dart';

abstract class QrCodeRepository {
  Future<Either<Failure, bool>> checkQRCode({required int qrCodeId});
}
