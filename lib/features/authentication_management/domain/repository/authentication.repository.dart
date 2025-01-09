import 'package:licence_driving_admin/core/resources/data_state.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_request.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_response.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/error.entity.dart';

abstract class AuthenticationRepository {
  Future<DataState> getCurrentUser();
  Future<DataState<AuthenticationResponseEntity,ErrorEntity>> loginUser(AuthenticationRequestEntity p);
  Future<DataState> logoutUser();
  Future<DataState> registerUser();
}
