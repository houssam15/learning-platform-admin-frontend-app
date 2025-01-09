abstract class AuthenticationState {}


class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationUnauthenticatedState extends AuthenticationState {}

class AuthenticationAuthenticatedState extends AuthenticationState {
  final String userId;

  AuthenticationAuthenticatedState(this.userId);
}

