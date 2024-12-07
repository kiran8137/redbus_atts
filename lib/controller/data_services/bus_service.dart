

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_bus_atts/model/bus_model/bus_model.dart';
import 'package:red_bus_atts/model/bus_route_model/bus_route_model.dart';

class BusService{

  final FirebaseFirestore firebaseFirestore;

  BusService({required this.firebaseFirestore});
  
  //To fetch buses in the particular route
  Future<List<BusModel>> getBuses({required routeId})async{
    try{
     final snapshot = await firebaseFirestore.collection('busList').where('routeId',isEqualTo: routeId).get();
     final result = snapshot.docs.map((bus)=> BusModel.fromJson(json: bus.data())).toList();
     if(result.isNotEmpty){
      return result;
     }
     return [];

    }catch(error){
      log(error.toString());
      throw Exception();
    }
  }
 
 //To get a bus route detail with the given routeId
  Future<BusRouteModel> getBusRouteDetail({required String routeId})async{
    try{
     final result = await firebaseFirestore.collection('busRoutes').doc(routeId).get();
     final busRoute = BusRouteModel.fromJson(json: result.data()!);
     return busRoute;

    }catch(error){
      log(error.toString());
      throw Exception();
    }
  }
}