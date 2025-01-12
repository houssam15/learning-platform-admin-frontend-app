import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:licence_driving_admin/core/resources/data_state.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_request.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/usecases/login_user.usecase.dart';
import 'package:licence_driving_admin/features/authentication_management/presentation/bloc/login/login_event.dart';
import 'package:licence_driving_admin/features/authentication_management/presentation/bloc/login/login_state.dart';

import '../../../domain/entities/authentication_response.entity.dart';
import '../../../domain/entities/error.entity.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUseCase _loginUserUseCase;

  LoginBloc(this._loginUserUseCase) : super(LoginInitialState()) {
    on<LoginRequestedEvent>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(LoginRequestedEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    DataState<AuthenticationResponseEntity,ErrorEntity> ds = await _loginUserUseCase(
        AuthenticationRequestEntity(
          usernameOrEmail: event.usernameOrEmail,
          password: event.password
        )
    );
    if (ds is DataSuccess) {
      emit(LoginSuccessState(ds.data?.localId));
    } else {
      emit(LoginFailureState(ds.error?.messages??["Unkown Error,try later please"]));
    }
  }
}