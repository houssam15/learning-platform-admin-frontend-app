import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:licence_driving_admin/core/constants/constants.dart";
import "package:licence_driving_admin/core/resources/data_state.dart";
import "package:licence_driving_admin/features/authentication_management/data/models/authentication_request.model.dart";
import "package:licence_driving_admin/features/authentication_management/data/models/authentication_response.model.dart";
import "package:licence_driving_admin/features/authentication_management/data/models/error.model.dart";
import "package:licence_driving_admin/features/authentication_management/data/models/get_me_request.model.dart";
import "package:licence_driving_admin/features/authentication_management/data/models/get_me_response.model.dart";
import "package:licence_driving_admin/features/authentication_management/presentation/bloc/authentication/authentication_state.dart";

class RemoteAuthenticationApi {
  final String SERVER_ERROR = "Server error , please try later";
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
      return DataSuccess(AuthenticationResponseModel.fromJson(response.data));
    }on DioException catch (e) {
      if (kDebugMode) print(e);
      return DataFailed(ErrorModel.fromJson(e.response?.data));
    }
  }

  Future<DataState<GetMeResponseModel,ErrorModel>> getMe(GetMeRequestModel p)async{
    try{
      final response = await _dio.get("/auth/me",options: Options(
        headers: {
          "authorization":"Bearer ${p.accessToken}"
        }
      ));
      return DataSuccess(GetMeResponseModel.fromJson(response.data,p.accessToken));
    }on DioException catch(e){
      if (kDebugMode) print(e);
      return DataFailed(ErrorModel.fromJson(e.response?.data));
    }
  }
}
