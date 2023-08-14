part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUp extends SignUpEvent {
  final String email;
  final String password;
  final String name;
  final String phoneNumber;
  final String qrId;

  const SignUp(
      {required this.email,
      required this.password,
      required this.name,
      required this.phoneNumber,
      required this.qrId});

  @override
  List<Object> get props => [email, password];
}

class SignInWithGoogle extends SignUpEvent {
  const SignInWithGoogle();

  @override
  List<Object> get props => [];
}
