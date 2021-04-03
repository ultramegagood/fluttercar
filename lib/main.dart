import 'package:firstproject/AllScreens/loginScreen.dart';
import 'package:firstproject/AllScreens/mainscreen.dart';
import 'package:firstproject/AllScreens/signUpScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gachi Taxi',
      theme: ThemeData(
        fontFamily: "Brand Bolt",

        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.idScreen,
      routes:{
        SignUpScreen.idScreen: (context) => SignUpScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        MainScreen.idScreen: (context) => MainScreen(),
      } ,
      debugShowCheckedModeBanner: false,
    );
  }
}



