import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/error/failures.dart';
import 'package:find_scan_return_app/domain/entities/notification.dart';
import 'package:find_scan_return_app/domain/usecases/get_user_notification.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotificationUseCase getNotificationUseCase;
  NotificationBloc(this.getNotificationUseCase) : super(NotificationInitial()) {
    on<FetchNotification>(fetchNotification);
  }
  fetchNotification(
      FetchNotification event, Emitter<NotificationState> emit) async {
    emit(Loading());
    final result = await getNotificationUseCase.call(const NoParams());
    result.fold((l) {
      if (l is ServerFailure) {
        emit(const Error(message: AppStrings.serverFailure));
      } else {
        emit(const Error(message: AppStrings.credentialsFailure));
      }
    }, (r) {
      emit(NotificationsLoaded(notificationsLoaded: r));
    });
  }
}
