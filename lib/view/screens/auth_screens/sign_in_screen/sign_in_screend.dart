import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_bus_atts/controller/bloc/auth_bloc/auth_bloc.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';
import 'package:red_bus_atts/view/screens/auth_screens/forget_password_screen/forget_pass_screen.dart';
import 'package:red_bus_atts/view/screens/main_page/main_page.dart';
import 'package:red_bus_atts/view/screens/auth_screens/register_screen/register_screen.dart';
import 'package:red_bus_atts/view/widgets/custom_button.dart';
import 'package:red_bus_atts/view/widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColorConstants.surfaceColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is SigInSuccess){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const MainPage()),(Route<dynamic> predicate)=> false);
          }
          if(state is NotRegisteredState){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('No user registered with this account'),
              duration: Duration(seconds: 5),
            ));
          }
        },
        child: SafeArea(
            child: Center(
          child: Form(
            key: formkey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtils.screenWidth(context) * 0.06,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //custom text field. Email field
                  CustomTextField(
                    controller: emailController,
                    validator: (value) {
                      final regex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if (!regex.hasMatch(value!)) {
                        return "Enter a valid email";
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Email',
                    icon: Icons.email,
                  ),

                  SizedBox(
                    height: ScreenUtils.screenheight(context) * 0.01,
                  ),

                  //custom text field. password field
                  CustomTextField(
                    controller: passwordController,
                    validator: (value) {
                      final regExp = RegExp(
                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
                      if (!regExp.hasMatch(value!)) {
                        return "Password must be at least 8 characters long,include "
                            "uppercase letter,lowercase letter,number,special character";
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Password',
                    icon: Icons.password,
                  ),

                  SizedBox(
                    height: ScreenUtils.screenheight(context) * 0.01,
                  ),

                  const SizedBox(height: 10),

                  CustomButton(
                    text: 'SignIn',
                     onTap: () {
                      
                      BlocProvider.of<AuthBloc>(context).add(SigInEvent(emailId: emailController.text, password: passwordController.text));
                    }
                    ),
                  SizedBox(
                    height: ScreenUtils.screenWidth(context) * 0.01,
                  ),
                  Row(
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
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}

