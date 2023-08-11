import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/error/failures.dart';
import 'package:find_scan_return_app/domain/usecases/is_qrid_valid_usecase.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'qr_id_verification_state.dart';

class QrIdVerificationCubit extends Cubit<QrIdVerificationState> {
  final IsQrIdValidUsecase isQrIdValidUsecase;
  QrIdVerificationCubit(this.isQrIdValidUsecase)
      : super(QrIdVerificationInitial());

  checkIfQrIdValid(int qrId) async {
    emit(Loading());
    final result = await isQrIdValidUsecase.call(Params(qrId: qrId));
      result.fold((l) {
      if (l is ServerFailure) {
        emit(const Error(message: AppStrings.serverFailure));
      } else {
        emit(const Error(message: AppStrings.credentialsFailure));
      }
    }, (r) {
      emit(QrIDVerification(isValid: r));
    });
  }
}
