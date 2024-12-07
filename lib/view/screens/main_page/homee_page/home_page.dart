

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:red_bus_atts/controller/provider/bus_route_controller.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';
import 'package:red_bus_atts/view/widgets/bus_route_tile.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({super.key});
final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('rebuiling');
    
    Provider.of<BusRouteController>(context,listen: false).getFeaturedBusRoute();
    return   Scaffold(
      
       backgroundColor: AppColorConstants.surfaceColor,
       body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtils.screenWidth(context) * 0.06,),
              child: TextFormField(
                    controller: searchController,
                   // obscureText: obsureText ?? false,
                   decoration: const InputDecoration(
                    prefixIcon:   Icon(Icons.search),
                     border: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.black)
                     ),
                      focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: AppColorConstants.primaryColor)
                      ),
                      hintText: 'Search'
                   ),
                   onChanged: (String value){
                     Provider.of<BusRouteController>(context,listen: false).searchRoutes(query: searchController.text);
                   },
                   
                  ),
            ),
            Expanded(
              child: Consumer<BusRouteController>(
                builder: (context, value, child) {
                 
                  return value.isLoading == false ? ListView.separated(
                  itemCount: value.featuredBusRoutes.length,
                   itemBuilder: (context, index) {
                     final busRoute = value.featuredBusRoutes[index];
                     
                     return BusRouteTile(busRoute: busRoute);
                
                   },
                   separatorBuilder:(context, index) => const Divider(),
                ):
                  const Center(child: CircularProgressIndicator() ,);
                },
                 
              ),
            ),
          ],
        )
       ),
    );
  }
}

