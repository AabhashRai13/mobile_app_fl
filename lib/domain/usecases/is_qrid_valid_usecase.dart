import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/usecases/usecase.dart';
import 'package:find_scan_return_app/domain/repositories/qrcode_repository.dart';
import '../../app/error/failures.dart';

class IsQrIdValidUsecase implements UseCase<bool, Params> {
  final QrCodeRepository repository;

  IsQrIdValidUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.checkQRCode(qrCodeId: params.qrId);
  }
}

class Params extends Equatable {
  final int qrId;
  const Params({required this.qrId});

  @override
  List<Object> get props => [qrId];
}
