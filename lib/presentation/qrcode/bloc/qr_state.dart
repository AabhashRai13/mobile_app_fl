part of 'qr_bloc.dart';

abstract class QrState extends Equatable {
  const QrState();

  @override
  List<Object> get props => [];
}

class QrInitial extends QrState {}

class QrLoading extends QrState {}

class QrError extends QrState {
  final String message;
  const QrError({required this.message});
}

class QrChecked extends QrState {
  final bool checked;
  const QrChecked({required this.checked});
}
