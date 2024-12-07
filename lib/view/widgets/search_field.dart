
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:red_bus_atts/controller/provider/bus_route_controller.dart';
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
         
        );
  }
}

