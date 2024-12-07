
 

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:red_bus_atts/controller/data_services/auth_service.dart';
// import 'package:red_bus_atts/controller/data_services/user_service.dart';
// import 'package:red_bus_atts/model/user_model/user_model.dart';
// import 'package:red_bus_atts/view/screens/main_page/main_page.dart';

// class AuthController extends ChangeNotifier{
    
//    final AuthServices authServices;
//    final UserService userService;
//     bool isLoading = false;
//     bool isLogged = false;
//     String sigIn =  ''; // to know whether its not already registered
//     String register = ''; // to know whether its already registered


//   AuthController({required this.userService, required this.authServices});


//   void registerUser({required String emailId, required String password})async{

//     try{
//       isLoading = true;
      
//         String result =  await authServices.checkUserAlreadyRegistered(emailid: emailId);
//         if(result == "notregistered"){
//           final response = await authServices.registerUser(emailId: emailId, password: password);
//             UserModel userModel = UserModel(userId: response!.user!.uid, emailId: emailId);
//        await userService.saveUserToDatabase(usermodel: userModel);
//         await authServices.saveUserLoggedstatus(value: true);
//         }
//         if(result == 'alreadyregistered'){
//            register = "AlreadyRegistered";
//            notifyListeners();
//         }
//       //   }
//       //  final response = await authServices.registerUser(emailId: emailId, password: password);
//       //       UserModel userModel = UserModel(userId: response!.user!.uid, emailId: emailId);
//       //  await userService.saveUserToDatabase(usermodel: userModel);
//       //  bool result =  await authServices.checkUserAlreadyRegistered(emailid: emailId);
//       //  if(result == true){
//       //    register = "AlreadyexictedAccount";
//       //  }else{
//       //    final response = await authServices.registerUser(emailId: emailId, password: password);
         
//       //     UserModel userModel = UserModel(userId: response!.user!.uid, emailId: emailId);
//       //  await userService.saveUserToDatabase(usermodel: userModel);
//       //   authServices.saveUserLoggedstatus(value: true);
//       //  }
     

//     }catch(error){
     
//       log(error.toString());
//     }
    
//   }

//   void signIn({required String emailId, required String password})async{
//     try{

//       // isLoading = true;
//       // bool result =  await authServices.checkUserAlreadyRegistered(emailid:emailId);
//       // if(result == false){
//       //    sigIn = 'newAccount';
//       //   final response = await authServices.sigInUser(emailId: emailId, password: password);
//       // if(response!=null){
//       //   authServices.saveUserLoggedstatus(value: true);
//       //   //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const MainPage()),(Route<dynamic> predicate)=> false);
//       // }else{
//       //   authServices.saveUserLoggedstatus(value: false);
//       // }
//       // }
//        final response = await authServices.sigInUser(emailId: emailId, password: password);

      
//     }catch(error){
      
//       log(error.toString());
//     }
//   }

//   void logOut()async{
//     try{
//     final response = await authServices.logOut();
//     await authServices.saveUserLoggedstatus(value: response);
//     }catch(error){
//       log(error.toString());
//     }
//   }

//   void checkUserLoggedStatus()async{
//     try{
//       final status = await authServices.getUserLoggedStatus();
//       isLogged = status;
//       notifyListeners();
//     }catch(error){
//       log(error.toString());
//     }
//   }
// }