import 'package:licence_driving_admin/features/authentication_management/data/models/user.model.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_response.entity.dart';

class AuthenticationResponseModel extends AuthenticationResponseEntity {
  AuthenticationResponseModel({
    super.localId,
    required super.accessToken,
    required super.refreshToken
  });

  // Factory method for JSON deserialization
  factory AuthenticationResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationResponseModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken']
    );
  }

  // Convert to JSON for saving or API responses
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken
    };
  }

  AuthenticationResponseEntity toEntity({int? localId}) {
    return AuthenticationResponseEntity(
      localId: localId,
      accessToken: accessToken,
      refreshToken: refreshToken
    );
  }
}
