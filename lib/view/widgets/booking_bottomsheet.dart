

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:red_bus_atts/controller/bloc/bus_bloc/bus_bloc.dart';
import 'package:red_bus_atts/controller/provider/bus_controller.dart';
import 'package:red_bus_atts/model/bus_model/bus_model.dart';
import 'package:red_bus_atts/model/bus_route_model/bus_route_model.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';
import 'package:red_bus_atts/view/widgets/custom_button.dart';

class BookingBottomSheet extends StatelessWidget {
  const BookingBottomSheet({
    super.key,
    required this.busRoute,
    required this.busProvider, required this.busModel,
  });

  final BusRouteModel busRoute;
  final BusController busProvider;
  final BusModel busModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtils.screenheight(context)*0.5,
      decoration: BoxDecoration(
        color:   AppColorConstants.surfaceColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)) 
      ),
    
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            title:   Text(busModel.busName,
            style: GoogleFonts.poppins(
             fontSize: ScreenUtils.screenWidth(context)*0.06,
             fontWeight: FontWeight.bold
            ),
            ),
            ),
          ListTile(
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
                
               },
              ),
              Divider(),
            ListTile(
              leading: SizedBox(
                
                child: Column(
                  children: [
                    Text("Pickup Date",
                                      style: GoogleFonts.poppins(
                                       fontSize: ScreenUtils.screenWidth(context)*0.05,
                                       fontWeight: FontWeight.bold,
                                       
                                      ),
                                      overflow: TextOverflow.fade,
                                      ),
                      Text(busProvider.selectedDate,
                                      style: GoogleFonts.poppins(
                                       fontSize: ScreenUtils.screenWidth(context)*0.05,
                                       fontWeight: FontWeight.w500,
                                       
                                      ),
                                      overflow: TextOverflow.fade,
                                      ),
                  ],
                ),
              ),
    
              trailing: IconButton(
                onPressed: ()async{
                  final selectedDate = await showDatePicker(
                    context: context, 
                    firstDate: DateTime.now(), 
                    lastDate: DateTime(DateTime.now().year + 10));
                   final date =  selectedDate !=null ? "${selectedDate.day}- ${selectedDate.month}-${selectedDate.year}":"" ;
                      
                  Provider.of<BusController>(context,listen: false).selectDate(date: date);
                }, 
                icon: Icon(Icons.calendar_view_day_rounded)
                ),
            ),
            CustomButton(
              onTap: (){
                 busProvider.changeDateTodefaul();
                 Navigator.pop(context);
              },
              text: 'Book')
        ],
      )
    
    
    
    );
  }
}