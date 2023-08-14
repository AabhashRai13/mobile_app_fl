import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/usecases/usecase.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/domain/repositories/user_repository.dart';
import '../../app/error/failures.dart';

class GetUserUsecase implements UseCase<Authentication, Params> {
  final UserRepository repository;

  GetUserUsecase(this.repository);

  @override
  Future<Either<Failure, Authentication>> call(Params params) async {
    return await repository.getUser();
  }
}

class Params extends Equatable {
  final String username;

  const Params({
    required this.username,
  });

  @override
  List<Object> get props => [username];
}
