abstract class LoginEvent {}

class LoginRequestedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginRequestedEvent(this.email, this.password);
}

