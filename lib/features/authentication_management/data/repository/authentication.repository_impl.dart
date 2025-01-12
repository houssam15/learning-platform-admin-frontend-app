import 'package:flutter/foundation.dart';
import 'package:licence_driving_admin/core/constants/error_codes.dart';
import 'package:licence_driving_admin/core/resources/data_state.dart';
import 'package:licence_driving_admin/features/authentication_management/data/data_sources/local/authentication_api.local.dart';
import 'package:licence_driving_admin/features/authentication_management/data/data_sources/remote/authentication_api.remote.dart';
import 'package:licence_driving_admin/features/authentication_management/data/models/authentication_request.model.dart';
import 'package:licence_driving_admin/features/authentication_management/data/models/authentication_response.model.dart';
import 'package:licence_driving_admin/features/authentication_management/data/models/error.model.dart';
import 'package:licence_driving_admin/features/authentication_management/data/models/get_me_request.model.dart';
import 'package:licence_driving_admin/features/authentication_management/data/models/user.model.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_request.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_response.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/error.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/user.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/repository/authentication.repository.dart';

import '../models/get_me_response.model.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final RemoteAuthenticationApi _remoteAuthenticationApi;
  final LocalAuthenticationApi _localeAuthenticationApi;
  AuthenticationRepositoryImpl(
      this._remoteAuthenticationApi, this._localeAuthenticationApi);

  @override
  Future<DataState<UserEntity, ErrorEntity>> getCurrentUser() async {
    dynamic dataState =  await _localeAuthenticationApi.getLastConnectedUser();
    if (dataState is DataFailed) return DataFailed(dataState.error.toEntity());
    return DataSuccess(dataState.data.toEntity());
  }

  @override
  Future<DataState<AuthenticationResponseEntity, ErrorEntity>> loginUser(
      AuthenticationRequestEntity p) async {
    try{
      //log in
      DataState<AuthenticationResponseModel, ErrorModel> ds1 = await _remoteAuthenticationApi.loginUser(AuthenticationRequestModel.fromEntity(p));
      if (ds1 is DataFailed) return DataFailed(ds1.error?.toEntity());
      //get me
      DataState<GetMeResponseModel,ErrorModel> ds2 = await _remoteAuthenticationApi.getMe(GetMeRequestModel(ds1.data?.accessToken));
      if(ds2 is DataFailed) return DataFailed(ds2.error?.toEntity());
      //save user locally
      DataState<int,ErrorModel> ds3 = await _localeAuthenticationApi.saveUser(ds2.data?.user);
      if(ds3 is DataFailed) return DataFailed(ds2.error?.toEntity());
      return DataSuccess(ds1.data!.toEntity(localId: ds3.data));
    }catch(err){
      if(kDebugMode) print(err);
      return DataFailed(ErrorEntity(code: unknownErrorCode,messages: ["System error , please contact support!"]));
    }
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

  @override
  Future<DataState<UserEntity,ErrorEntity>> getUserByKey(int? key) async{
    try{
      DataState<UserModel,ErrorModel> ds =  await _localeAuthenticationApi.getUserByKey(key);
      if(ds is DataFailed) return DataFailed(ds.error?.toEntity());
      return DataSuccess(ds.data!.toEntity());
    }catch(err){
      if(kDebugMode) print(err);
      return DataFailed(ErrorEntity(code: unknownErrorCode,messages: ["System error , please contact support!"]));
    }
  }


}
