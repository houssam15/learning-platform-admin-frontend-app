import 'package:licence_driving_admin/core/resources/data_state.dart';
import 'package:licence_driving_admin/features/authentication_management/data/data_sources/remote/authentication_api.remote.dart';
import 'package:licence_driving_admin/features/authentication_management/data/models/authentication_request.model.dart';
import 'package:licence_driving_admin/features/authentication_management/data/models/error.model.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_request.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_response.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/repository/authentication.repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<DataState> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<DataState<AuthenticationResponseEntity, ErrorModel>> loginUser(AuthenticationRequestEntity p) async {
    dynamic dataState = await RemoteAuthenticationApi().loginUser(AuthenticationRequestModel.fromEntity(p));
    if (dataState is DataFailed) return DataFailed(dataState.error.toEntity());
    return DataSuccess(dataState.data.toEntity());
  }

  @override
  Future<DataState> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  Future<DataState> registerUser() {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
