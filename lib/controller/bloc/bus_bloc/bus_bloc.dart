import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:red_bus_atts/controller/data_services/bus_service.dart';
import 'package:red_bus_atts/model/bus_model/bus_model.dart';

part 'bus_event.dart';
part 'bus_state.dart';

class BusBloc extends Bloc<BusEvent, BusState> {
  final BusService busService;
  BusBloc({required this.busService}) : super(BusInitial()) {
     
     on<GetBusList>(getBusList);
  }

  FutureOr<void> getBusList(GetBusList event, Emitter<BusState> emit)async {
     try{
      emit(BusInitial());
      final result = await busService.getBuses(routeId: event.routId);
      if(result.isNotEmpty){
        emit(BusListSuccess(busList: result));
      }else{
        emit(BusListEmpty());
      }
       
      
    }catch(error){
      log(error.toString());
    }
  }
}
