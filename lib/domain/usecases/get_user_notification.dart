import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/error/failures.dart';
import 'package:find_scan_return_app/domain/entities/notification.dart';
import 'package:find_scan_return_app/domain/repositories/notification_repository.dart';

import '../../app/usecases/usecase.dart';

class GetNotificationUseCase implements UseCase<List<Notification>, NoParams> {
  final NotificationRepository repository;

  GetNotificationUseCase(this.repository);

  @override
  Future<Either<Failure, List<Notification>>> call(NoParams noparams) async {
    return await repository.getNotifications();
  }
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object> get props => [];
}