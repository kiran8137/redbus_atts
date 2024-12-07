
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/view/screens/auth_screens/forget_password_screen/forget_pass_screen.dart';
import 'package:red_bus_atts/view/screens/auth_screens/register_screen/register_screen.dart';

class NotAUserWidget extends StatelessWidget {
  const NotAUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Not a user",
            style: GoogleFonts.poppins(
              fontSize: ScreenUtils.screenWidth(context) * 0.03,
              fontWeight: FontWeight.w500,
            )),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const RegisterScreen()));
          },
          child: Text("Register",
              style: GoogleFonts.poppins(
                  fontSize:
                      ScreenUtils.screenWidth(context) * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue)),
        ),
         SizedBox(width: ScreenUtils.screenWidth(context)*0.01),
         Text("|",
            style: GoogleFonts.poppins(
              fontSize: ScreenUtils.screenWidth(context) * 0.03,
              fontWeight: FontWeight.w500,
            )),
          SizedBox(width: ScreenUtils.screenWidth(context)*0.01),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPasswordScreen()));
            },
            child: Text("Forget password",
                style: GoogleFonts.poppins(
                    fontSize:
                        ScreenUtils.screenWidth(context) * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue)),
          ),
          
      ],
    );
  }
}

