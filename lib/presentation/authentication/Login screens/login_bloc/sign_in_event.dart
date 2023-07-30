part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignIn extends SignInEvent {
  final String username;
  final String password;
  const SignIn({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class SignInWithGoogle extends SignInEvent {
  const SignInWithGoogle();

  @override
  List<Object> get props => [];
}
