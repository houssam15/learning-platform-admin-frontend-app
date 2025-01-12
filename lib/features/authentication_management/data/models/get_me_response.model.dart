import 'package:licence_driving_admin/features/authentication_management/data/models/user.model.dart';

class GetMeResponseModel{
  UserModel user;
  GetMeResponseModel(this.user);

  factory GetMeResponseModel.fromJson(dynamic data,String? accessToken){
    return GetMeResponseModel(UserModel.fromJson({...data,"accessToken":accessToken})!);
  }
}