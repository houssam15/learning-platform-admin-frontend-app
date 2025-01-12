abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final int? key;
  LoginSuccessState(this.key);
}

class LoginFailureState extends LoginState {
  final List<String> errorMessages;

  LoginFailureState(this.errorMessages);
}