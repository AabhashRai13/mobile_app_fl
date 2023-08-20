import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/error/failures.dart';
import 'package:find_scan_return_app/app/params/image_upload_params.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/domain/usecases/get_user_usecase.dart';
import 'package:find_scan_return_app/domain/usecases/update_user_usecase.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUsecase getUserUsecase;
  final UpdateUserUsecase updateUserUsecase;
  UserBloc(this.getUserUsecase, this.updateUserUsecase) : super(UserInitial()) {
    on<GetUserEvent>(getUser);
    on<UpdateUserEvent>(updateUser);
  }

  getUser(GetUserEvent event, Emitter<UserState> emit) async {
    emit(Loading());
    final result = await getUserUsecase.call(const Params(username: ""));

    result.fold((l) {
      if (l is ServerFailure) {
        emit(const Error(message: AppStrings.serverFailure));
      } else {
        emit(const Error(message: AppStrings.credentialsFailure));
      }
    }, (r) {
      emit(UserLoaded(user: r));
    });
  }

  updateUser(UpdateUserEvent event, Emitter<UserState> emit) async {
    emit(Loading());
    final result = await updateUserUsecase.call(UserParams(
        user: event.user, imageUploadParams: event.imageUploadParams));

    result.fold((l) {
      if (l is ServerFailure) {
        emit(const Error(message: AppStrings.serverFailure));
      } else {
        emit(const Error(message: AppStrings.credentialsFailure));
      }
    }, (r) {
      emit(UserUpdated(user: r));
    });
  }
}
