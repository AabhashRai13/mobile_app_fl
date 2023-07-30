import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/error/failures.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/sign_in_usecase.dart';
import '../../../resources/strings_manager.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUsecase signInUsecase;

  SignInBloc(
    this.signInUsecase,
  ) : super(SignInInitial()) {
    on<SignIn>(signIn);
  }
  signIn(SignIn event, Emitter<SignInState> emit) async {
    
    emit(Loading());
    final result = await signInUsecase
        .call(Params(username: event.username, password: event.password));

    result.fold((l) {
      if (l is ServerFailure) {
        emit(const Error(message: AppStrings.serverFailure));
      } else {
        emit(const Error(message: AppStrings.credentialsFailure));
      }
    }, (r) {
      emit(Loaded(authentication: r));
    });
  }
}