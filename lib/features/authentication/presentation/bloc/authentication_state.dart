part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState{}

class AuthenticationLoaded extends AuthenticationState{}

class AuthenticationError extends AuthenticationState{

  String message;

  AuthenticationError({required this.message});

}

class RegistrationSuccess extends AuthenticationState{}

class RegistrationError extends AuthenticationState{
  String message;
  RegistrationError({required this.message});

}
