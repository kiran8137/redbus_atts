part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//states for register user
final class RegisterSuccess extends AuthState{}

final class RegisterErrorState extends AuthState{}

final class AlreadyRegisteredState extends AuthState{}

//states for sigin


final class SigInSuccess extends AuthState{}

final class SigInErrorState extends AuthState{} 

final class NotRegisteredState extends AuthState{}


//state for forget password

final class SendEmailSuccess extends AuthState{}
