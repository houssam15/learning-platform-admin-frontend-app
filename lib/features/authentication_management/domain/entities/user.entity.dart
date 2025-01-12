import 'package:licence_driving_admin/features/authentication_management/data/models/user.model.dart';


class UserEntity{

  final int id;

  final String username;

  final String email;

  final String? profilePictureUrl; // Optional
 
  final Roles role;

  final String accessToken;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    this.profilePictureUrl,
    required this.role,
    required this.accessToken
  });

}
