part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {}

class UpdateUserEvent extends UserEvent {
  final Authentication user;
  final ImageUploadParams? imageUploadParams;
  const UpdateUserEvent({required this.user, this.imageUploadParams});
}
