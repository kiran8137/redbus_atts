

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:red_bus_atts/controller/provider/navigationbar_controller.dart';
import 'package:red_bus_atts/utilitis/helper_function/helper_function.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorbarProvider =  Provider.of<NavigationbarController>(context);
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorConstants.surfaceColor,
        leading: Image.asset("assets/redbuslogo.png"),
      ),
      backgroundColor: AppColorConstants.surfaceColor,
      bottomNavigationBar: CurvedNavigationBar(
        height: ScreenUtils.screenheight(context) * 0.07,
        color: AppColorConstants.primaryColor,
        
        backgroundColor: AppColorConstants.surfaceColor,
        animationDuration: Duration(milliseconds: 300),
        index: navigatorbarProvider.currentPage,
        items:  [
            ImageIcon(AssetImage("assets/redbuslogo.png")),
           Icon(Icons.person)
          ],
          onTap: (int index){
            navigatorbarProvider.setCurrentPage(index);
          },
        ),

        body: HelperFunction.getCurrentScreen(index: navigatorbarProvider.currentPage),
    );
  }
}


