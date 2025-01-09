import 'package:licence_driving_admin/features/authentication_management/domain/entities/error.entity.dart';

class ErrorModel extends ErrorEntity {
  ErrorModel({
    required super.code,
    required super.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      code: json['code'],
      message: json['message'],
    );
  }

  ErrorEntity toEntity() {
    return ErrorEntity(
      code: code,
      message: message,
    );
  }
}
