


import 'package:flutter/material.dart';
import 'package:red_bus_atts/view/screens/main_page/homee_page/home_page.dart';
import 'package:red_bus_atts/view/screens/main_page/profile_screen/page_screen.dart';

class HelperFunction {

  static Widget getCurrentScreen({required int index}){

    Widget screen;

    switch(index){
      case 0:
      screen = HomeScreen();
      break;

      case 1:
      screen = ProfileScreen();

      default:
      screen = HomeScreen();
    }

    return screen;
  }


  
}