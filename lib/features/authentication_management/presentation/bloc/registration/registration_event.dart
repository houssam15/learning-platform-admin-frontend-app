abstract class RegistrationEvent {}

class RegistrationRequestedEvent extends RegistrationEvent {
  final String name;
  final String email;
  final String password;

  RegistrationRequestedEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}