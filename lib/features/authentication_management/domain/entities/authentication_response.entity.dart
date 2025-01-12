import 'package:licence_driving_admin/features/authentication_management/data/models/user.model.dart';

class AuthenticationResponseEntity {
  int? localId;
  final String? accessToken;
  final String? refreshToken;

  AuthenticationResponseEntity({
    this.localId,
    this.accessToken,
    this.refreshToken,
  });

  

}
