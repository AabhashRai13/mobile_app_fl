part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

class Loading extends NotificationState {}

class Error extends NotificationState {
  final String message;
  const Error({required this.message});
}

class NotificationsLoaded extends NotificationState {
  final List<Notification> notificationsLoaded;
  const NotificationsLoaded({required this.notificationsLoaded});
}
