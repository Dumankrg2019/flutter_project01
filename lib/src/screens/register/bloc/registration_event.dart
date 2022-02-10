part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class RegistrationInPressed extends RegistrationEvent {
  final String? nickname;
  final String? phone;
  final String? email;
  final String? password;

  RegistrationInPressed({
    required this.nickname,
    required this.phone,
    required this.email,
    required this.password,
   });
}