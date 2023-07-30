part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class Loading extends SignInState {
  @override
  List<Object> get props => [];
}
class GoogleLoading extends SignInState {}

class MicroSoftLoading extends SignInState {}

class Loaded extends SignInState {
  final Authentication authentication;

  const Loaded({required this.authentication});

  @override
  List<Object> get props => [authentication];
}

class QrCreated extends SignInState {
  final bool created;

  const QrCreated({required this.created});

  @override
  List<Object> get props => [created];
}

class Error extends SignInState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}