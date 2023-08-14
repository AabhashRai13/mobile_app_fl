import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:find_scan_return_app/app/preferences/shared_preferences_manager.dart';
import 'package:find_scan_return_app/data/repositories/qrcode_repositories_impl.dart';
import 'package:find_scan_return_app/data/repositories/user_repository_impl.dart';
import 'package:find_scan_return_app/domain/repositories/qrcode_repository.dart';
import 'package:find_scan_return_app/domain/repositories/user_repository.dart';
import 'package:find_scan_return_app/domain/usecases/get_user_usecase.dart';
import 'package:find_scan_return_app/domain/usecases/is_qrid_valid_usecase.dart';
import 'package:find_scan_return_app/presentation/qrVerification/cubit/qr_id_verification_cubit.dart';
import 'package:find_scan_return_app/presentation/qrcode/bloc/qr_bloc.dart';
import 'package:find_scan_return_app/presentation/qrcode/qrService/qr_service.dart';
import 'package:find_scan_return_app/presentation/userDetails/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';
import '../data/repositories/authentication_repositories_impl.dart';
import '../domain/repositories/authentication_repository.dart';
import '../domain/usecases/is_signed_in_usecase.dart';
import '../domain/usecases/sign_in_usecase.dart';
import '../domain/usecases/sign_out_usecase.dart';
import '../domain/usecases/sign_up_usecase.dart';
import '../presentation/authentication/Login screens/login_bloc/sign_in_bloc.dart';
import '../presentation/authentication/authentication cubit/authentication_cubit.dart';
import '../presentation/authentication/register screens/register_bloc/sign_up_bloc.dart';
import '../presentation/obscure/obscure_cubit.dart';
import 'network/network_info.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  //preferences
  SharedPreferencesManager sharedPreferencesManager =
      await SharedPreferencesManager.getInstance();
  sl.registerSingleton<SharedPreferencesManager>(sharedPreferencesManager);

//// connectivity
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //repository

  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
            sl(),
            sl(),
          ));

  sl.registerLazySingleton<QrCodeRepository>(() => QrCodeRepositoryImpl(
        sl(),
      ));
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImplementation(sl(), sl()));

  // UseCases
  sl.registerLazySingleton<SignUpUsecase>(() => SignUpUsecase(sl()));
  sl.registerLazySingleton<SignInUsecase>(() => SignInUsecase(sl()));

  sl.registerLazySingleton<SignOutUsecase>(() => SignOutUsecase(sl()));
  sl.registerLazySingleton<IsSignedInUsecase>(() => IsSignedInUsecase(sl()));
  sl.registerLazySingleton<IsQrIdValidUsecase>(() => IsQrIdValidUsecase(sl()));
  sl.registerLazySingleton<GetUserUsecase>(() => GetUserUsecase(sl()));

  /// services
  sl.registerLazySingleton<QrService>(() => QrService());

  /// blocs and cubits
  sl.registerFactory<ObscureCubit>(() => ObscureCubit());
  sl.registerFactory<AuthenticationCubit>(() => AuthenticationCubit());
  sl.registerFactory<SignUpBloc>(() => SignUpBloc(sl()));
  sl.registerFactory<SignInBloc>(() => SignInBloc(sl()));
  sl.registerLazySingleton<QrBloc>(() => QrBloc());
  sl.registerFactory<QrIdVerificationCubit>(() => QrIdVerificationCubit(sl()));
  sl.registerFactory<UserBloc>(() => UserBloc(sl()));
}
