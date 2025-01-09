import 'package:licence_driving_admin/features/authentication_management/data/models/user.model.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_response.entity.dart';

class AuthenticationResponseModel extends AuthenticationResponseEntity {
  AuthenticationResponseModel({
    required super.accessToken,
    required super.refreshToken,
    required super.user,
  });

  // Factory method for JSON deserialization
  factory AuthenticationResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationResponseModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      user: UserModel.fromJson(json['user']),
    );
  }

  // Convert to JSON for saving or API responses
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'user': user.toJson(),
    };
  }

  AuthenticationResponseEntity toEntity() {
    return AuthenticationResponseEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user
    );
  }
}
