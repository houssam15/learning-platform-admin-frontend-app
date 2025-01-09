import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:licence_driving_admin/core/constants/constants.dart";
import "package:licence_driving_admin/core/resources/data_state.dart";
import "package:licence_driving_admin/features/authentication_management/data/models/authentication_request.model.dart";
import "package:licence_driving_admin/features/authentication_management/data/models/authentication_response.model.dart";
import "package:licence_driving_admin/features/authentication_management/data/models/error.model.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_state.dart";

class RemoteAuthenticationApi {
  final String SYSTEM_ERROR = "System error , please try later";
  late final Dio _dio;
  RemoteAuthenticationApi() {
    _dio = Dio()
      ..options.baseUrl = SERVER_BASE_URL
      ..interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
  }

  Future<DataState<AuthenticationResponseModel, ErrorModel>> loginUser(AuthenticationRequestModel p) async {
    try {
      final response = await _dio.post("/auth/login", data: p.toJson());
      if (response.statusCode != 200) return DataFailed(ErrorModel.fromJson(response.data));
      return DataSuccess(AuthenticationResponseModel.fromJson(response.data));
    } catch (err) {
      if (kDebugMode) print(err);
      return DataFailed(ErrorModel(code: "1", message: SYSTEM_ERROR));
    }
  }
}
