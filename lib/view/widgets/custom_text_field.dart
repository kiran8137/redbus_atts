import 'package:flutter/material.dart';
 
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.icon, required this.hintText,   this.obsureText, required this.validator, required this.controller,
  });
  final IconData icon;
  final String hintText;
  final bool? obsureText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsureText ?? false,
     decoration: InputDecoration(
      prefixIcon:   Icon(icon),
       border: const OutlineInputBorder(
         borderSide: BorderSide(color: Colors.black)
       ),
        focusedBorder: const OutlineInputBorder(
         borderSide: BorderSide(color: AppColorConstants.primaryColor)
        ),
        hintText: hintText
     ),
     validator: validator,
     autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}