class PasswordResetConfirmationEntity {
  final String email;
  final String resetToken;
  final String newPassword;

  PasswordResetConfirmationEntity({
    required this.email,
    required this.resetToken,
    required this.newPassword,
  });


}
