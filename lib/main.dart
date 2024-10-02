import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_classes/cubit/auth_cubit.dart';
import 'package:rowad_classes/data/api_client.dart';
import 'package:rowad_classes/screens/SplashScreen/splash_screen.dart';
import 'package:rowad_classes/screens/Student/home/home.dart';
import 'package:rowad_classes/screens/Student/login/login.dart';
import 'package:rowad_classes/screens/Student/register/RegisterStudent.dart';

void main() {
  final apiClient = ApiClient(Dio()); // تأكد من إعداد ApiClient بشكل صحيح

  runApp(
    BlocProvider(
      create: (context) => AuthCubit(apiClient),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final ApiClient apiClient = ApiClient(Dio());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(apiClient)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          // '/register': (context) => RegisterStudent(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterStudent(),
          '/home':(context)=>Home(),
        },
      ),
    );
  }
}

