part of 'qr_id_verification_cubit.dart';

sealed class QrIdVerificationState extends Equatable {
  const QrIdVerificationState();

  @override
  List<Object> get props => [];
}

final class QrIdVerificationInitial extends QrIdVerificationState {}

class QrIDVerification extends QrIdVerificationState {
  final bool isValid;
  const QrIDVerification({required this.isValid});

  @override
  List<Object> get props => [isValid];
}

class Loading extends QrIdVerificationState {}

class Error extends QrIdVerificationState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
