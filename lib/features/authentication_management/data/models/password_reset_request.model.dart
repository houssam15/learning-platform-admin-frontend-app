import 'package:licence_driving_admin/features/authentication_management/domain/entities/password_reset_request.entity.dart';

class PasswordResetRequestModel extends PasswordResetRequestEntity {

  PasswordResetRequestModel({required super.email});
  
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
