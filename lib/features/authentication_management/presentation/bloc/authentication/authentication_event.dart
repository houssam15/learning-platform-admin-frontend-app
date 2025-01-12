abstract class AuthenticationEvent {}

class AppStartedEvent extends AuthenticationEvent {}


class LoggedOutEvent extends AuthenticationEvent {}

class UserConnectedEvent extends AuthenticationEvent {
  final int? key;
  UserConnectedEvent(this.key);
}
