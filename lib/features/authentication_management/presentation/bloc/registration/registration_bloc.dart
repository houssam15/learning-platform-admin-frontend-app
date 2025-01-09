import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:licence_driving_admin/core/resources/data_state.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/usecases/register_user.usecase.dart';
import 'package:licence_driving_admin/features/authentication_management/presentation/bloc/registration/registration_event.dart';
import 'package:licence_driving_admin/features/authentication_management/presentation/bloc/registration/registration_state.dart';


class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterUserUseCase _registerUserUseCase;
  
  RegistrationBloc(this._registerUserUseCase) : super(RegistrationInitialState()) {
    on<RegistrationRequestedEvent>(_onRegistrationRequested);
  }

  Future<void> _onRegistrationRequested(RegistrationRequestedEvent event, Emitter<RegistrationState> emit) async {
    emit(RegistrationLoadingState());
    final dataState = await _registerUserUseCase(/*event.name,event.email,event.password*/null);
    if (dataState is DataSuccess) {
      emit(RegistrationSuccessState());
    } else{
      emit(RegistrationFailureState(dataState.error?.message ?? "Registration failed"));
    }
  }
}
