part of 'qr_bloc.dart';

abstract class QrEvent extends Equatable {
  const QrEvent();

  @override
  List<Object> get props => [];
}

class CheckQr extends QrEvent {
  final int numberOfQrcodes;
  const CheckQr({required this.numberOfQrcodes});
}

class SetController extends QrEvent {
  final QRViewController controller;
  const SetController({required this.controller});
}

class SetQrId extends QrEvent {
  final int qrId;
  const SetQrId({required this.qrId});
}

