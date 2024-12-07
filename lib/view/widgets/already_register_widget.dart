

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/view/screens/auth_screens/sign_in_screen/sign_in_screend.dart';

class AlreadyRegisteredWidget extends StatelessWidget {
  const AlreadyRegisteredWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already registered",
         style : GoogleFonts.poppins(
        fontSize: ScreenUtils.screenWidth(context)*0.03,
        fontWeight: FontWeight.w500,
      )
        ),
         GestureDetector(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
           },
           child: Text("SigIn",
            style : GoogleFonts.poppins(
                                    fontSize: ScreenUtils.screenWidth(context)*0.04,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue
                                  )
           ),
         ),
      ],
    );
  }
}

