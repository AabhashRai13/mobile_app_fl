part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {
  final bool isSignIn;
  const AuthenticationState({required this.isSignIn});

  @override
  List<Object> get props => [isSignIn];
}

class ObscureCubitState extends Equatable {
  final bool obscure;
  const ObscureCubitState({required this.obscure});

  @override
  List<Object> get props => [obscure];
}
