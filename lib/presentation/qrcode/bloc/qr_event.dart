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