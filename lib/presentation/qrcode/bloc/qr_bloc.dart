import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(QrInitial()) {
    on<SetController>(setQrController);
    on<SetQrId>(setQrId);
  }

  setQrController(SetController event, Emitter<QrState> emit) {
    emit(QrController(qrViewController: event.controller));
  }

  setQrId(SetQrId event, Emitter<QrState> emit) {
    emit(QrId(qrId: event.qrId));
  }
}
