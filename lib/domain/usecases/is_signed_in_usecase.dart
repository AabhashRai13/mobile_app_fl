import '../repositories/authentication_repository.dart';

class IsSignedInUsecase {
  final AuthenticationRepository repository;

  IsSignedInUsecase(this.repository);

  Future<bool> call() async {
    return await repository.isSignedIn();
  }
}
