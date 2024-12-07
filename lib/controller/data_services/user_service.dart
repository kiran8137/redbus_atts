

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_bus_atts/model/user_model/user_model.dart';

class UserService{

  Future<void> saveUserToDatabase({required UserModel usermodel}) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(usermodel.userId)
          .set(usermodel.toJson());
    } catch (e) {
      log("error while adding userdata $e");
      throw Exception("error while adding userdata $e");
    }
  }

  
}