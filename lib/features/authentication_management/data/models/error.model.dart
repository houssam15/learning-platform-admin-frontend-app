import 'package:licence_driving_admin/core/constants/error_codes.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/error.entity.dart';

class ErrorModel extends ErrorEntity {
  ErrorModel({
    required super.code,
    required super.messages,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      code: json['code']??unknownErrorCode,
      messages: json['message'] is List ? json['message']?.cast<String>()??[] : [json['message']]
    );
  }

  ErrorEntity toEntity() {
    return ErrorEntity(
      code: code,
      messages: messages,
    );
  }
}
