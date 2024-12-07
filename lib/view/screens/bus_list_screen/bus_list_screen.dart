
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
import 'package:red_bus_atts/view/widgets/booking_bottomsheet.dart';
import 'package:red_bus_atts/view/widgets/bus_list_tile.dart';
import 'package:red_bus_atts/view/widgets/custom_button.dart';

class BusListScreen extends StatelessWidget {
  const BusListScreen({super.key, required this.busRoute});
  final BusRouteModel busRoute;
  @override
  Widget build(BuildContext context) {
    final busProvider = Provider.of<BusController>(context,listen: false);
    return  Scaffold(
      backgroundColor: AppColorConstants.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppColorConstants.surfaceColor,
        title: Row(
         
          children: [
            Text(busRoute.routeFrom,
             style: GoogleFonts.poppins(
                   fontSize: ScreenUtils.screenWidth(context)*0.05,
                   fontWeight: FontWeight.bold
                  ),
             ),
             
            Text('-',
             style: GoogleFonts.poppins(
                   fontSize: ScreenUtils.screenWidth(context)*0.05,
                   fontWeight: FontWeight.w500
                  ),
             ),

             Text(busRoute.routeTo,
             style: GoogleFonts.poppins(
                   fontSize: ScreenUtils.screenWidth(context)*0.05,
                   fontWeight: FontWeight.bold
                  ),
             ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<BusBloc,BusState>(
          builder:(context, state) {
            
            if(state is BusInitial){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is BusListEmpty){
              return const Center(child: Text("Currently no buses available"));
            }
            
            if(state is BusListSuccess){

              return ListView.separated(
                itemBuilder:(context, index) {
                  final bus = state.busList[index];
                   return BusListTile(bus: bus, busRoute: busRoute, busProvider: busProvider);
                }, 
                separatorBuilder:(context, index) => const Divider(), 
                itemCount: state.busList.length
                );
              
             
               
    
         
        
     
            }else{
              return const Center(child:  CircularProgressIndicator(),);
            }
          },
          )
     
      )
    );
  }
}

