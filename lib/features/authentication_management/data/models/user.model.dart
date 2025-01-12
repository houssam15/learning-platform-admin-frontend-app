import 'package:licence_driving_admin/features/authentication_management/domain/entities/user.entity.dart';
import 'package:hive_ce/hive.dart';
import 'package:licence_driving_admin/core/constants/hive_types.dart';

@HiveType(typeId: userRoleTypeId)
enum Roles {
  @HiveField(0)
  admin,
  @HiveField(1)
  user
}

@HiveType(typeId: userTypeId)
class UserModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String? profilePictureUrl; // Optional
  @HiveField(4)
  final Roles role;
  @HiveField(5)
  final String accessToken;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.profilePictureUrl,
    required this.role,
    required this.accessToken
  });

  // Factory method for JSON deserialization
  static UserModel? fromJson(Map<String, dynamic>? json) {
    if(json==null) return null;
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'],
      role: Roles.values.byName(json['role']),
      accessToken: json['accessToken']
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'roles': role,
      'accessToken':accessToken
    };
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      username: user.username,
      email: user.email,
      profilePictureUrl: user.profilePictureUrl,
      role: user.role,
      accessToken: user.accessToken
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      email: email,
      role: role,
      profilePictureUrl: profilePictureUrl,
      accessToken:accessToken
    );
  }

  static List<UserEntity> toEntityList(List<UserModel> l){
    return l.map<UserEntity>((elm) => elm.toEntity()).toList();
  }

}
