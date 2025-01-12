class AuthenticationRequestEntity {
  final String? usernameOrEmail;
  final String? password;

  AuthenticationRequestEntity({
    required this.usernameOrEmail,
    required this.password,
  });
}
