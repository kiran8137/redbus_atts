
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:red_bus_atts/controller/data_services/bus_service.dart';
import 'package:red_bus_atts/model/bus_model/bus_model.dart';

class BusController extends ChangeNotifier{

  final BusService busService;
   bool isLoading = false;


  BusController({required this.busService});
  
  List<BusModel> buses = [];

  String selectedDate = "";
  

  Future<void> getBuses({required routeId})async{
    try{
      isLoading = true;
      final result = await busService.getBuses(routeId: routeId);
      buses = result;
      isLoading = false;
      print(result);
      notifyListeners();
    }catch(error){
      log(error.toString());
    }
  }

  void selectDate({required String date}){
    selectedDate = date;
    notifyListeners();
  }

  void changeDateTodefaul(){
    selectedDate = "";
    notifyListeners();
  }
  

}