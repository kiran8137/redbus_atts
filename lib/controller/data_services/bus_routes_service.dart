

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:red_bus_atts/model/bus_route_model/bus_route_model.dart';

class BusRoutesService{

  final FirebaseFirestore fireStore;

  BusRoutesService({required this.fireStore});

   
   Future<List<BusRouteModel>> getFeaturedBusRoute()async{

    try{
      final snapShot = await fireStore.collection("busRoutes").get();
      final busRoutes = snapShot.docs.map((routes)=> BusRouteModel.fromJson(json: routes.data())).toList();
      return busRoutes;
    }catch(error){
      log(error.toString());
      throw Exception();
    }
   }


   Future<List<BusRouteModel>> searchedRoutes({required String? query})async{

    try{
      final snapShot = await fireStore.collection('busRoutes').get();
      List<BusRouteModel> routes = snapShot.docs
          .map((dish) => BusRouteModel.fromJson(json: dish.data()))
          .toList();
      debugPrint(routes.toString());
      return routes
          .where((route) =>
              route.routeFrom.toLowerCase().contains(query!.toLowerCase()))
          .toList();
    }catch(error){
      log(error.toString());
      throw Exception();
    }
   }
   
}