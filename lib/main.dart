import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firstproject/AllScreens/loginScreen.dart';
import 'package:firstproject/AllScreens/mainscreen.dart';
import 'package:firstproject/AllScreens/signUpScreen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
DatabaseReference usersRef=FirebaseDatabase.instance.reference().child("Users");
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
      initialRoute: MainScreen.idScreen,
      routes:{
        SignUpScreen.idScreen: (context) => SignUpScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        MainScreen.idScreen: (context) => MainScreen(),
      } ,
      debugShowCheckedModeBanner: false,
    );
  }
}



