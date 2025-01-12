import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:licence_driving_admin/core/resources/data_state.dart';
import 'package:licence_driving_admin/features/authentication_management/data/models/error.model.dart';
import 'package:licence_driving_admin/features/authentication_management/data/models/user.model.dart';
import 'package:licence_driving_admin/injection_container.dart';

class LocalAuthenticationApi {
  final String SYSTEM_ERROR = "System error , please try later";

  LocalAuthenticationApi();

  Future<DataState<UserModel, ErrorModel>> getLastConnectedUser() async {
    try {
      final users = sl<Box<UserModel>>().values.toList();
      if (users.isEmpty) return DataFailed(ErrorModel(code: "2", messages: ["No records in user table"]));
      return DataSuccess(users.last);
    } catch (err) {
      if (kDebugMode) print(err);
      return DataFailed(ErrorModel(code: "1", messages: [SYSTEM_ERROR]));
    }
  }

  Future<DataState<int, ErrorModel>> saveUser(UserModel? user)async{
    try {
      if(user == null) return DataFailed(ErrorModel(code: "1",messages: ["user informations not found"]));
      int id = await sl<Box<UserModel>>().add(user);
      return DataSuccess(id);
    } catch (err) {
      if (kDebugMode) print(err);
      return DataFailed(ErrorModel(code: "0", messages: [SYSTEM_ERROR]));
    }
  }

  Future<DataState<UserModel, ErrorModel>> getUserByKey(int? key) async {
    try {
      final user = sl<Box<UserModel>>().get(key);
      if (user==null) return DataFailed(ErrorModel(code: "2", messages: ["user with key $key noy found"]));
      return DataSuccess(user);
    } catch (err) {
      if (kDebugMode) print(err);
      return DataFailed(ErrorModel(code: "1", messages: [SYSTEM_ERROR]));
    }
  }
  
  
}
