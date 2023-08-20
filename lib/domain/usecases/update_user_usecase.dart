import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_scan_return_app/app/params/image_upload_params.dart';
import 'package:find_scan_return_app/app/usecases/usecase.dart';
import 'package:find_scan_return_app/domain/entities/authentication.dart';
import 'package:find_scan_return_app/domain/repositories/user_repository.dart';
import '../../app/error/failures.dart';

class UpdateUserUsecase implements UseCase<Authentication, UserParams> {
  final UserRepository repository;

  UpdateUserUsecase(this.repository);

  @override
  Future<Either<Failure, Authentication>> call(UserParams params) async {
    return await repository.updateUser(params.user, params.imageUploadParams);
  }
}

class UserParams extends Equatable {
  final Authentication user;
  final ImageUploadParams imageUploadParams;
  const UserParams({required this.user, required this.imageUploadParams});

  @override
  List<Object> get props => [user];
}
