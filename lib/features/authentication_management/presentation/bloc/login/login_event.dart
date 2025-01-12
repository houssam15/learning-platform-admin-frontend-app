abstract class LoginEvent {}

class LoginRequestedEvent extends LoginEvent {
  final String? usernameOrEmail;
  final String? password;

  LoginRequestedEvent(this.usernameOrEmail, this.password);
}

