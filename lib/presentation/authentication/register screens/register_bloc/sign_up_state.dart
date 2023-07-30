part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class Loading extends SignUpState {}

class GoogleLoading extends SignUpState {}

class MicroSoftLoading extends SignUpState {}

class Loaded extends SignUpState {
  final Authentication authentication;

  const Loaded({required this.authentication});

  @override
  List<Object> get props => [authentication];
}

class Error extends SignUpState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}