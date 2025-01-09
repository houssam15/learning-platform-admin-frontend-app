abstract class RegistrationState {}

class RegistrationInitialState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationSuccessState extends RegistrationState {}

class RegistrationFailureState extends RegistrationState {
  final String errorMessage;

  RegistrationFailureState(this.errorMessage);
}