import 'package:licence_driving_admin/features/authentication_management/data/models/user.model.dart';

class AuthenticationResponseEntity {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  AuthenticationResponseEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  

}
