import 'package:licence_driving_admin/features/authentication_management/domain/entities/registration_request.entity.dart';

class RegistrationRequestModel extends RegistrationRequestEntity {

  RegistrationRequestModel({
    required super.username,
    required super.email,
    required super.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
