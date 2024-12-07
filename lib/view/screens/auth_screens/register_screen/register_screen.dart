

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_bus_atts/controller/bloc/auth_bloc/auth_bloc.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';
import 'package:red_bus_atts/view/screens/main_page/main_page.dart';
import 'package:red_bus_atts/view/screens/auth_screens/sign_in_screen/sign_in_screend.dart';
import 'package:red_bus_atts/view/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
     
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColorConstants.surfaceColor,
      body: BlocListener<AuthBloc,AuthState>(
        listener: (context, state) {
          if(state is RegisterSuccess){
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const MainPage()),(Route<dynamic> predicate)=> false);
          }
          if(state is AlreadyRegisteredState){
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('User already registered with this accont'),
              duration: Duration(seconds: 5),
            ));
          }
        },
        child: SafeArea(
           
          child: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding:   EdgeInsets.symmetric(horizontal: ScreenUtils.screenWidth(context) * 0.06,),
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
                
                    //custom text field. Email field
                       CustomTextField(
                        controller: emailController,
                      validator: (value){
                           final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                     if(!regex.hasMatch(value!)){
                                      return "Enter a valid email";
                                     }else{
                                      return null;
                                     }
                      },
                      hintText: 'Email',
                      icon: Icons.email,
                      ),
                
                    SizedBox(height: ScreenUtils.screenheight(context)*0.01,),
                
                    //custom text field. password field
                      CustomTextField(
                        controller: passwordController,
                      validator: (value){
                          final regExp = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
                                     if(!regExp.hasMatch(value!)){
                                      return "Password must be at least 8 characters long,include "
                                      "uppercase letter,lowercase letter,number,special character";
                                     }else{
                                      return null;
                                     }
                      },
                      hintText: 'Password',
                      icon: Icons.password,
                      ),
                    
                    SizedBox(height: ScreenUtils.screenheight(context)*0.01,),
                
                     //custom text field. confirm password field
                       CustomTextField(
                        controller: conformPasswordController,
                       validator: (value){
                          final regExp = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
                                     if(!regExp.hasMatch(value!)){
                                      return "Password must be at least 8 characters long,include "
                                      "uppercase letter,lowercase letter,number,special character";
                                     }else{
                                      return null;
                                     }
                      },
                      hintText: 'Conform Password',icon: Icons.password),
                
                     SizedBox(height: 10),
                
                     GestureDetector(
                      onTap: (){
                        if(formKey.currentState!.validate()){
                          if(formKey.currentState!.validate()){
                            if(passwordController.text == conformPasswordController.text){
                              BlocProvider.of<AuthBloc>(context).add(RegisterUserEvent(emailId: emailController.text, password: passwordController.text));
             
                              
                            }
                          }
                        }
                      },
                       child: Container(
                        height: 40,
                        width: ScreenUtils.screenWidth(context) *0.90,
                        decoration: BoxDecoration(
                          color: AppColorConstants.primaryColor,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text("Register",
                          style : GoogleFonts.poppins(
                            fontSize: ScreenUtils.screenWidth(context)*0.05,
                            fontWeight: FontWeight.w500,
                          )
                          ),
                        ),
                       ),
                     ),
                
                      SizedBox(height: ScreenUtils.screenWidth(context)*0.01,),
                     Row(
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
                     )
                  ],
                ),
              ),
            ),
          )
          ),
      ),
    );
  }
}

