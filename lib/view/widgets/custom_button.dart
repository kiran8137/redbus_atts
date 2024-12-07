import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, this.onTap,
  });

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        height: 40,
        width: ScreenUtils.screenWidth(context) * 0.90,
        decoration: BoxDecoration(
            color: AppColorConstants.primaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(text,
              style: GoogleFonts.poppins(
                fontSize: ScreenUtils.screenWidth(context) * 0.05,
                fontWeight: FontWeight.w500,
              )),
        ),
      ),
    );
  }
}
