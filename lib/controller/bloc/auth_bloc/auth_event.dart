part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}



class RegisterUserEvent extends AuthEvent{
  final String emailId;
  final String password;

  RegisterUserEvent({required this.emailId, required this.password});
}

class SigInEvent extends AuthEvent{
 final String emailId;
  final String password;

  SigInEvent({required this.emailId, required this.password});
  
}

class ForgetPasswordEvent extends AuthEvent{
  final String emailId;

  ForgetPasswordEvent({required this.emailId});
}