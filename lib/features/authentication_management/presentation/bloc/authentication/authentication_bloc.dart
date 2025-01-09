import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:licence_driving_admin/core/resources/data_state.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/usecases/get_current_user.usecase.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/usecases/logout_user.usecase.dart';
import 'package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_event.dart';
import 'package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{
  final LogoutUserUseCase _logoutUserUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  
  AuthenticationBloc(
    this._logoutUserUseCase,
    this._getCurrentUserUseCase
  ) : super(AuthenticationLoadingState()) {
    on<AppStartedEvent>(_onAppStarted);
    on<LoggedOutEvent>(_onLoggedOut);
  }

  Future<void> _onAppStarted(AppStartedEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());
    final dataState = await _getCurrentUserUseCase(null);
    if (dataState is DataSuccess) {
      emit(AuthenticationAuthenticatedState(dataState.data!.id));
    } else {
      emit(AuthenticationUnauthenticatedState());
    }
  }

  void _onLoggedOut(LoggedOutEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());
    await _logoutUserUseCase(null);
    emit(AuthenticationUnauthenticatedState());
  }

}

