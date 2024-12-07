
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_bus_atts/controller/provider/bus_controller.dart';
import 'package:red_bus_atts/model/bus_model/bus_model.dart';
import 'package:red_bus_atts/model/bus_route_model/bus_route_model.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/view/widgets/booking_bottomsheet.dart';

class BusListTile extends StatelessWidget {
  const BusListTile({
    super.key,
    required this.bus,
    required this.busRoute,
    required this.busProvider,
  });

  final BusModel bus;
  final BusRouteModel busRoute;
  final BusController busProvider;

  @override
  Widget build(BuildContext context) {
    return ListTile(
         minTileHeight: 100,
         //tileColor: Colors.blue,
         title: Text(bus.busName,
         style: GoogleFonts.poppins(
               fontSize: ScreenUtils.screenWidth(context)*0.05,
               fontWeight: FontWeight.w600
              ),
         ),
         trailing: Column(
           children: [
             const Text('from'),
             Text(
               "₹ ${bus.price}",
               style: GoogleFonts.poppins(
                 fontSize:  ScreenUtils.screenWidth(context)*0.04,
                 fontWeight: FontWeight.w500
               ),
             ),
           ],
         ),
          subtitle: Row(
           children: [
             Container(
               width: ScreenUtils.screenWidth(context)*.70,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Text(bus.departure,
                  style: GoogleFonts.poppins(
                   fontSize: ScreenUtils.screenWidth(context)*0.05,
                   fontWeight: FontWeight.bold
                  ),
                  ),
        
                 
                  Text(busRoute.duration,
                   style: GoogleFonts.poppins(
                   fontSize: ScreenUtils.screenWidth(context)*0.03,
                   color: Colors.grey
                  ),
                  ),
        
             Text(bus.arrival,
             style: GoogleFonts.poppins(
                   fontSize: ScreenUtils.screenWidth(context)*0.05,
                   fontWeight: FontWeight.bold
                  ),
             )
               ],),
             ),
             
            
           ],
         ),
    
         onTap: (){
          //bottom sheet to book bus
          showModalBottomSheet(
            isDismissible: false,
            
            isScrollControlled: true,
            context: context,
             builder:(context){
              return BookingBottomSheet(busRoute: busRoute, busProvider: busProvider,busModel: bus,);
             }
             );
         },
        
        
        
          
        );
  }
}

