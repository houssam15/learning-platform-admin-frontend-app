import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_request.entity.dart';

class AuthenticationRequestModel extends AuthenticationRequestEntity {
  AuthenticationRequestModel({
    required super.usernameOrEmail,
    required super.password,
  });

  factory AuthenticationRequestModel.fromEntity(AuthenticationRequestEntity e) {
    return AuthenticationRequestModel(
      usernameOrEmail: e.usernameOrEmail,
      password: e.password
    );
  }
  // Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'emailOrUsername': usernameOrEmail,
      'password': password,
    };
  }
}
