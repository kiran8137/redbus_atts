import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:red_bus_atts/controller/bloc/auth_bloc/auth_bloc.dart';
import 'package:red_bus_atts/controller/bloc/bus_bloc/bus_bloc.dart';
 
 
import 'package:red_bus_atts/controller/data_services/auth_service.dart';
import 'package:red_bus_atts/controller/data_services/bus_routes_service.dart';
import 'package:red_bus_atts/controller/data_services/bus_service.dart';
import 'package:red_bus_atts/controller/data_services/user_service.dart';
import 'package:red_bus_atts/controller/provider/bus_controller.dart';
import 'package:red_bus_atts/controller/provider/bus_route_controller.dart';
import 'package:red_bus_atts/controller/provider/navigationbar_controller.dart';
import 'package:red_bus_atts/firebase_options.dart';
import 'package:red_bus_atts/view/screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavigationbarController(),
        ),
        ChangeNotifierProvider(
            create: (context) => BusRouteController(
                busRoutesService:
                    BusRoutesService(fireStore: FirebaseFirestore.instance))),
        ChangeNotifierProvider(
            create: (context) => BusController(
                busService:
                    BusService(firebaseFirestore: FirebaseFirestore.instance)))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
                userService: UserService(),
                authServices:
                    AuthServices(fireabaseAuth: FirebaseAuth.instance)),
          ),
          BlocProvider(
            create: (context) => BusBloc(busService: BusService(firebaseFirestore: FirebaseFirestore.instance)),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
