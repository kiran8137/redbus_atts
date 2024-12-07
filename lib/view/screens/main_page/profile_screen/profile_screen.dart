
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';
import 'package:red_bus_atts/view/screens/auth_screens/sign_in_screen/sign_in_screend.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         
     backgroundColor: AppColorConstants.surfaceColor,
     body: SafeArea(
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("logout",
                          style : GoogleFonts.poppins(
                            fontSize: ScreenUtils.screenWidth(context)*0.05,
                            fontWeight: FontWeight.w500,
                          )
                          ),
            onTap: (){
              showDialog(
                context: context,
                 builder: (context){
                 return AlertDialog(
                  title: Text("Are you sure want to delete"),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: Text('cancel')
                      ),

                      TextButton(
                      onPressed: (){
                         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const SignInScreen()),(Route<dynamic> predicate)=> false);
                      }, 
                      child: Text('Ok')
                      ),
                  ],
                  );
                 }
                 );
            },
          )
        ],
      )
     ),
    );
  }
}