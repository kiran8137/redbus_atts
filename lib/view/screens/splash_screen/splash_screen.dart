
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';
import 'package:red_bus_atts/view/screens/main_page/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late final AnimationController animationController = AnimationController(
    duration:  Duration(seconds: 3),
    vsync: this);

    late final Animation<double> animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);

    @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    animationController.repeat();
    checkLoginStatus();
    super.initState();
  }

  

  Future<void> checkLoginStatus() async {
    
    final sharedPref = await SharedPreferences.getInstance();

    
   final loggedStatus = sharedPref.getBool("loggedIn") ?? false;
    

    // Navigate to appropriate screen
    if (loggedStatus) {
       Timer(Duration(seconds: 3), ()=>
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
      )
       );
     
    } else {
       Timer(Duration(seconds: 3), ()=>
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
      )
       );
    }
  }
  @override
  Widget build(BuildContext context) {
     
    return    Scaffold(
      backgroundColor: AppColorConstants.surfaceColor,

      //logo at the center and with fade in or zoom animation
      body: SafeArea(
        child: Center(
          child: FadeTransition(
            opacity: animation,
            child: Container(
              height: ScreenUtils.screenheight(context)*0.5,
               width: ScreenUtils.screenWidth(context)*0.5,
              child: Image.asset('assets/redbuslogo.png', )),
            ),
        ),
      ),


      
    );
  }
}