import 'package:licence_driving_admin/features/authentication_management/domain/entities/password_reset_confirmation.entity.dart';

class PasswordResetConfirmationModel extends PasswordResetConfirmationEntity {

  PasswordResetConfirmationModel({
    required super.email,
    required super.resetToken,
    required super.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'resetToken': resetToken,
      'newPassword': newPassword,
    };
  }
}
