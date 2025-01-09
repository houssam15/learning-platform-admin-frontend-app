import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:licence_driving_admin/core/resources/data_state.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/usecases/login_user.usecase.dart';
import 'package:licence_driving_admin/features/authentication_management/presentation/bloc/login/login_event.dart';
import 'package:licence_driving_admin/features/authentication_management/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUseCase _loginUserUseCase;

  LoginBloc(this._loginUserUseCase) : super(LoginInitialState()) {
    on<LoginRequestedEvent>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(LoginRequestedEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());

    final dataState = await _loginUserUseCase(/*email: event.email, password: event.password*/);
    if (dataState is DataSuccess) {
      emit(LoginSuccessState());
    } else if (dataState is DataFailed) {
      emit(LoginFailureState(dataState.error?.message ?? "An error occurred"));
    }
  }
}