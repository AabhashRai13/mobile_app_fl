import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/usecases/usecase.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/domain/repositories/user_repository.dart';
import '../../app/error/failures.dart';

class UpdateUserUsecase implements UseCase<Authentication, UserParams> {
  final UserRepository repository;

  UpdateUserUsecase(this.repository);

  @override
  Future<Either<Failure, Authentication>> call(UserParams params) async {
    return await repository.updateUser(params.user);
  }
}

class UserParams extends Equatable {
  final Authentication user;

  const UserParams({required this.user});

  @override
  List<Object> get props => [user];
}
