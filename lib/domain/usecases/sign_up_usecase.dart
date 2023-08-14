import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/usecases/usecase.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/domain/repositories/authentication_repository.dart';
import '../../app/error/failures.dart';

class SignUpUsecase implements UseCase<Authentication, Params> {
  final AuthenticationRepository repository;

  SignUpUsecase(this.repository);

  @override
  Future<Either<Failure, Authentication>> call(Params params) async {
    return await repository.signUp(
        email: params.email,
        password: params.password,
        userName: params.name,
        phoneNumber: params.phoneNumber,
        qrId: params.qrId);
  }
}

class Params extends Equatable {
  final String email;
  final String password;
  final String name;
  final String phoneNumber;
  final String qrId;

  const Params(
      {required this.email,
      required this.password,
      required this.name,
      required this.phoneNumber,
      required this.qrId});

  @override
  List<Object> get props => [email, password, name, phoneNumber, qrId];
}
