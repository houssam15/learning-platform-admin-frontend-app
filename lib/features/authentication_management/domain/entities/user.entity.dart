class UserEntity {
  final String id;
  final String username;
  final String email;
  final String? profilePictureUrl; // Optional
  final List<String> roles; // Example: ['admin', 'user']

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    this.profilePictureUrl,
    required this.roles,
  });

}
