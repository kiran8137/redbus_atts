import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_bus_atts/controller/bloc/auth_bloc/auth_bloc.dart';
import 'package:red_bus_atts/utilitis/screen_utils/screen_util.dart';
import 'package:red_bus_atts/utilitis/theme/app_color_constants.dart';
import 'package:red_bus_atts/view/widgets/custom_button.dart';
import 'package:red_bus_atts/view/widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColorConstants.surfaceColor,
        title: Text("Password Recovery",
            style: GoogleFonts.poppins(
              fontSize: ScreenUtils.screenWidth(context) * 0.05,
              fontWeight: FontWeight.w500,
            )),
      ),
      backgroundColor: AppColorConstants.surfaceColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
           if(state is SendEmailSuccess){
             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Email send Successfully'),
              duration: Duration(seconds: 5),
            ));
           }
        },
        child: SafeArea(
            child: Center(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtils.screenWidth(context) * 0.06,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                      icon: Icons.email,
                      hintText: 'email',
                      validator: (value) {
                        final regex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                        if (!regex.hasMatch(value!) || value.isEmpty) {
                          return "Enter a valid email";
                        } else {
                          return null;
                        }
                      },
                      controller: emailController),
                  SizedBox(height: 10),
                  CustomButton(
                    text: 'Send',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(ForgetPasswordEvent(emailId: emailController.text));
                      }
                    },
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
