part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationInLoading extends RegistrationState {}

class RegistrationInLoaded extends RegistrationState {}

class RegistrationInFailed extends RegistrationState {
  final String? message;

  RegistrationInFailed({
    required this.message
  });
}
