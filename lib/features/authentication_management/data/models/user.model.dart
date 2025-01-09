import 'package:licence_driving_admin/features/authentication_management/domain/entities/user.entity.dart';

class UserModel extends UserEntity {

  UserModel({
    required super.id,
    required super.username,
    required super.email,
    super.profilePictureUrl,
    required super.roles,
  });

  // Factory method for JSON deserialization
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'],
      roles: List<String>.from(json['roles'] ?? []),
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'roles': roles,
    };
  }
}
