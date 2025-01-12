import 'package:licence_driving_admin/features/authentication_management/domain/entities/user.entity.dart';

abstract class AuthenticationState {}


class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationUnauthenticatedState extends AuthenticationState {}

class AuthenticationAuthenticatedState extends AuthenticationState {
  final UserEntity connectedUser;

  AuthenticationAuthenticatedState(this.connectedUser);
}

