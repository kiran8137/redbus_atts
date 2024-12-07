

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices{

final FirebaseAuth fireabaseAuth;
 

  AuthServices({required this.fireabaseAuth});


  Future<UserCredential?> registerUser({required String emailId, required String password,})async{
   
   try{
   final response = await fireabaseAuth.createUserWithEmailAndPassword(email: emailId, password: password);
  
   return response;
     
   }catch(error){
     
     log(error.toString());
     throw Exception();
   }
   

  }


  Future<User?> sigInUser({required String emailId, required String password})async{

    try{
      final response = await fireabaseAuth.signInWithEmailAndPassword(email: emailId, password: password);
      debugPrint('logged with email : ${response.user!.email}');
      return response.user;
    }catch(error){
      log(error.toString());
      throw Exception();
    }
  }

  Future<bool> logOut()async{
   try{
    fireabaseAuth.signOut();
    return false;
   }catch(error){
    throw Exception();
   }
  }



  Future<void> resetPassword({required String email}) async {
     
     try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

     }catch(error){
      log(error.toString());
     }
  }

  Future<void> saveUserLoggedstatus({required bool value})async{

    try{
      final sharedPref = await SharedPreferences.getInstance();
     await sharedPref.setBool('loggedIn', value);
    }catch(error){
        log(error.toString());
        throw Exception();
    }
  }

  

  Future<bool> getUserLoggedStatus()async{
    final sharedPref = await SharedPreferences.getInstance();
    try{
      final status =   sharedPref.getBool('loggedIn');
      if(status == true){
        return true;
      }else{
        return false;
      }

    }catch(error){
      log(error.toString());
      throw Exception();
    }
  }


   Future<String> checkUserAlreadyRegistered(
      {required String? emailid}) async {
    try {
      final result = await FirebaseFirestore.instance
          .collection("Users")
          .where("emailId", isEqualTo: emailid)
          .get();
      print(result.docs);
      if (result.docs.isEmpty) {
        print("notregistered");
        return 'notregistered';
      } else {
        print('alreadyregistered');
        return 'alreadyregistered';
      }
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
  }

}