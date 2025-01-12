import "package:get_it/get_it.dart";
import "package:hive_ce/hive.dart";
import "package:licence_driving_admin/core/constants/hive_boxes.dart";
import "package:licence_driving_admin/features/authentication_management/data/data_sources/local/authentication_api.local.dart";
import "package:licence_driving_admin/features/authentication_management/data/data_sources/remote/authentication_api.remote.dart";
import "package:licence_driving_admin/features/authentication_management/data/models/user.model.dart";
import "package:licence_driving_admin/features/authentication_management/data/repository/authentication.repository_impl.dart";
import "package:licence_driving_admin/features/authentication_management/domain/repository/authentication.repository.dart";
import "package:licence_driving_admin/features/authentication_management/domain/usecases/get_connected_user.usecase.dart";
import "package:licence_driving_admin/features/authentication_management/domain/usecases/get_current_user.usecase.dart";
import "package:licence_driving_admin/features/authentication_management/domain/usecases/login_user.usecase.dart";
import "package:licence_driving_admin/features/authentication_management/domain/usecases/logout_user.usecase.dart";
import "package:licence_driving_admin/features/authentication_management/domain/usecases/register_user.usecase.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_bloc.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/login/login_bloc.dart";

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<RemoteAuthenticationApi>(RemoteAuthenticationApi());
  sl.registerSingleton<Box<UserModel>>(Hive.box<UserModel>(userBox));
  sl.registerSingleton<LocalAuthenticationApi>(LocalAuthenticationApi());
  sl.registerSingleton<AuthenticationRepository>(AuthenticationRepositoryImpl(sl(),sl()));
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase(sl()));
  sl.registerSingleton<GetCurrentUserUseCase>(GetCurrentUserUseCase(sl()));
  sl.registerSingleton<LogoutUserUseCase>(LogoutUserUseCase(sl()));
  sl.registerSingleton<RegisterUserUseCase>(RegisterUserUseCase(sl()));
  sl.registerSingleton<GetConnectedUserUseCase>(GetConnectedUserUseCase(sl()));
  sl.registerFactory<AuthenticationBloc>(() => AuthenticationBloc(sl(), sl(),sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
}
