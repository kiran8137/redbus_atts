import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_bus_atts/controller/bloc/bus_bloc/bus_bloc.dart';
import 'package:red_bus_atts/model/bus_route_model/bus_route_model.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/view/screens/bus_list_screen/bus_list_screen.dart';

class BusRouteTile extends StatelessWidget {
  const BusRouteTile({
    super.key,
    required this.busRoute,
  });

  final BusRouteModel busRoute;

  @override
  Widget build(BuildContext context) {
    return ListTile(
     minTileHeight: 100,
     //tileColor: Colors.blue,
     title: Row(
       children: [
         Container(
           width: ScreenUtils.screenWidth(context)*.70,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              Text(busRoute.routeFrom,
              style: GoogleFonts.poppins(
               fontSize: ScreenUtils.screenWidth(context)*0.05,
               fontWeight: FontWeight.bold
              ),
              ),
    
             
              Text("To",
               style: GoogleFonts.poppins(
               fontSize: ScreenUtils.screenWidth(context)*0.03,
               color: Colors.grey
              ),
              ),
    
         Text(busRoute.routeTo,
         style: GoogleFonts.poppins(
               fontSize: ScreenUtils.screenWidth(context)*0.05,
               fontWeight: FontWeight.bold
              ),
         )
           ],),
         ),
         
        
       ],
     ),
    
     subtitle:  Text(busRoute.duration,
     style: GoogleFonts.poppins(
           fontSize: ScreenUtils.screenWidth(context)*0.03,
           fontWeight: FontWeight.w500
          ),
     ),
     trailing: Column(
       children: [
         const Text('from'),
         Text(
           "₹ ${busRoute.price}",
           style: GoogleFonts.poppins(
             fontSize:  ScreenUtils.screenWidth(context)*0.04,
             fontWeight: FontWeight.w500
           ),
         ),
       ],
     ),
     onTap: (){
      //Provider.of<BusController>(context,listen: false).getBuses(routeId: busRoute.routeId);
      BlocProvider.of<BusBloc>(context).add(GetBusList(routId: busRoute.routeId));
      Navigator.push(context, CupertinoPageRoute(builder: (context)=> BusListScreen(busRoute: busRoute,)));
     },
    );
  }
}