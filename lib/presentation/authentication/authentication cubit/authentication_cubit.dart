import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';
//// this cubit is for landing page to switch between registration and login not actual is signed in
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationState(isSignIn: true));

  toogle(bool value) {
    emit(AuthenticationState(isSignIn: value));
  }
}
