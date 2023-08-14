part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final Authentication user;
  const UserLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class Loading extends UserState {}

class Error extends UserState {
  final String message;
  const Error({required this.message});
}
