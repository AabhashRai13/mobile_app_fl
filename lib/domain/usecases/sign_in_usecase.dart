import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/usecases/usecase.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import '../../app/error/failures.dart';
import '../repositories/authentication_repository.dart';

class SignInUsecase implements UseCase<Authentication, Params> {
  final AuthenticationRepository repository;

  SignInUsecase(this.repository);

  @override
  Future<Either<Failure, Authentication>> call(Params params) async {
    return await repository.signIn(
        userName: params.username, password: params.password);
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  const Params({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}