
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:red_bus_atts/controller/bloc/bus_bloc/bus_bloc.dart';
 
 
import 'package:red_bus_atts/controller/provider/bus_controller.dart';
import 'package:red_bus_atts/model/bus_route_model/bus_route_model.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';
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
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is BusListEmpty){
              return Center(child: Text("Currently no buses available"));
            }
            
            if(state is BusListSuccess){

              return ListView.separated(
                itemBuilder:(context, index) {
                  final bus = state.busList[index];
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
      showModalBottomSheet(
        isDismissible: false,
        
        isScrollControlled: true,
        context: context,
         builder:(context){
          return Container(
            width: double.infinity,
            height: ScreenUtils.screenheight(context)*0.4,
            decoration: BoxDecoration(
              color:   AppColorConstants.surfaceColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)) 
            ),

            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
         );
     },
    
    
    
      
    );
                }, 
                separatorBuilder:(context, index) => Divider(), 
                itemCount: state.busList.length
                );
              
             
               
    
         
        
     
            }else{
              return Center(child:  CircularProgressIndicator(),);
            }
          },
          )
     
      )
    );
  }
}