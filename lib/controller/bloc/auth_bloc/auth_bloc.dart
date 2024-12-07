import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_bus_atts/controller/data_services/auth_service.dart';
import 'package:red_bus_atts/controller/data_services/user_service.dart';
import 'package:red_bus_atts/model/user_model/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthServices authServices;
  final UserService userService;
  AuthBloc({required this.userService, required this.authServices}) : super(AuthInitial()) {
     
     on<RegisterUserEvent>(registerUser);
     on<SigInEvent>(signInUser);
     on<ForgetPasswordEvent>(forgetPassword);
  }

  FutureOr<void> registerUser(RegisterUserEvent event, Emitter<AuthState> emit)async {
    try{
     
      emit(AuthInitial());
        String result =  await authServices.checkUserAlreadyRegistered(emailid: event.emailId);
        if(result == "notregistered"){
          final response = await authServices.registerUser(emailId: event.emailId, password: event.password);
            UserModel userModel = UserModel(userId: response!.user!.uid, emailId: event.emailId);
       await userService.saveUserToDatabase(usermodel: userModel);
        await authServices.saveUserLoggedstatus(value: true);
        emit(RegisterErrorState());
        }
        if(result == 'alreadyregistered'){
           emit(AlreadyRegisteredState());
        }
       

    }catch(error){
     
      log(error.toString());
    }
  }

  FutureOr<void> signInUser(SigInEvent event, Emitter<AuthState> emit)async {

    try{
      emit(AuthInitial());
String result =  await authServices.checkUserAlreadyRegistered(emailid: event.emailId);
     


      if(result == 'alreadyregistered'){
        final response = await authServices.sigInUser(emailId: event.emailId, password: event.password);
          authServices.saveUserLoggedstatus(value: true);
         emit(SigInSuccess());
      }
      if(result == 'notregistered'){
        emit(NotRegisteredState());
      }
    }catch(error){
     log(error.toString());
    }
     
         
        
     
      }


  
  FutureOr<void> forgetPassword(ForgetPasswordEvent event, Emitter<AuthState> emit)async {
     try{
      await authServices.resetPassword(email: event.emailId);
      emit((SendEmailSuccess()));
    }catch(error){
       
      log(error.toString());
    }
  }
  }

