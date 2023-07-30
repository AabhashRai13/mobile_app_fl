import '../repositories/authentication_repository.dart';

class SignOutUsecase {
  final AuthenticationRepository repository;

  SignOutUsecase(this.repository);

  Future<void> call() async {
    return await repository.signOut();
  }
}
