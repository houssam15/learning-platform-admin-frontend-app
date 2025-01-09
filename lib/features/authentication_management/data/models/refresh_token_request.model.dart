import 'package:licence_driving_admin/features/authentication_management/domain/entities/refresh_token_request.entity.dart';

class RefreshTokenRequestModel extends RefreshTokenRequestEntity {

  RefreshTokenRequestModel({
    required super.refreshToken,
  });

  // Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'refreshToken': refreshToken,
    };
  }
}
