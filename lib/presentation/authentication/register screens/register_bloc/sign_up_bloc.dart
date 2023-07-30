import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/error/failures.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/domain/usecases/sign_up_usecase.dart';
import 'package:find_scan_return_app/presentation/resources/strings_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUsecase signUpUsecase;

  SignUpBloc(this.signUpUsecase) : super(SignUpInitial()) {
    on<SignUp>(signUp);
  }
  signUp(SignUp event, Emitter<SignUpState> emit) async {
    emit(Loading());
    final result = await signUpUsecase.call(
        Params(email: event.email, password: event.password, name: event.name));
    result.fold((l) {
      if (l is ServerFailure) {
        emit(const Error(message: AppStrings.serverFailure));
      } else {
        emit(const Error(message: AppStrings.credentialsFailure));
      }
    }, (r) => emit(Loaded(authentication: r)));
  }
}