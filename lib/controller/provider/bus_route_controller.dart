

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:red_bus_atts/controller/data_services/bus_routes_service.dart';
import 'package:red_bus_atts/model/bus_route_model/bus_route_model.dart';

class BusRouteController extends ChangeNotifier{

  final BusRoutesService busRoutesService;

  List<BusRouteModel> featuredBusRoutes = [];

  bool isLoading = false;

  BusRouteController({required this.busRoutesService});

  void getFeaturedBusRoute()async{

    try{
      isLoading = true;
      final busRoutes = await busRoutesService.getFeaturedBusRoute();
      featuredBusRoutes = busRoutes;
      isLoading = false;
      notifyListeners();

    }catch(error){
      log(error.toString());
    }
  }


  void searchRoutes({required String query})async{
    if(query.isNotEmpty){
    final searchedBusRoute =  await busRoutesService.searchedRoutes(query: query);
      featuredBusRoutes.clear();
      featuredBusRoutes.addAll(searchedBusRoute);
      notifyListeners();
    }else{
      featuredBusRoutes = featuredBusRoutes;
      notifyListeners();
    }
  }
}