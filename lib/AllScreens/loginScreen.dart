import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firstproject/AllScreens/mainscreen.dart';
import 'package:firstproject/AllScreens/signUpScreen.dart';
import 'package:firstproject/main.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  static const String idScreen ="LogIn";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 35.0,),
              Image(image: AssetImage("images/logo.png"),
              width:390.0,
              height:250.0 ,
              alignment: Alignment.center,),
              SizedBox(height: 1.0,),
              Text(
                "Login as rider",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand-Regular"),
                textAlign: TextAlign.center
              ),

              Padding(padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 1.0,),
                  TextField(
                    controller: emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "email",
                      labelStyle: TextStyle(
                        fontSize: 14.0,
                      ),
                      hintStyle:TextStyle(
                        color: Colors.grey,
                        fontSize: 10.0,
                      ),
                    ),
                    style: TextStyle(fontSize: 14.0),
                  ),
                SizedBox(height: 1.0,),
                TextField(
                  controller: passwordTextEditingController,
                  obscureText:true ,
                  decoration: InputDecoration(
                    labelText: "Passsword",
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                    ),
                    hintStyle:TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                    ),
                  ),
                  style: TextStyle(fontSize: 14.0),
                ),

                SizedBox(height: 10.0,),
                RaisedButton(
                  color:Colors.yellow,
                  textColor: Colors.white,
                  child: Container(
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 10.0,fontFamily: "Brand Bold"),

                      ),
                    ),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0),
                  ),
                  onPressed: (){
                    if(!emailTextEditingController.text.contains("@")){
                      displayToastMessage("Email address not valid", context);
                    }
                    else if(passwordTextEditingController.text.isEmpty){
                      displayToastMessage("Please enter a password ", context);
                    }
                    else{
                      loginAuthUser(context);
                    }
                   loginAuthUser(context);
                  },
                )

                ],
              ),
              ),

              FlatButton(
                onPressed:(){
                Navigator.pushNamedAndRemoveUntil(context, SignUpScreen.idScreen, (route) => false);
                },
                child: Text(
                  "Register here",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  void loginAuthUser(BuildContext context)async{
    final User firebaseUser= (await _firebaseAuth.signInWithEmailAndPassword(email: emailTextEditingController.text, password: passwordTextEditingController.text).catchError((errorMsg){displayToastMessage("Error: "+errorMsg.toString(), context);})).user;
    if(firebaseUser!=null)
    {

      usersRef.child(firebaseUser.uid).once().then( (DataSnapshot snap) {
        if (snap.value != null){
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
          displayToastMessage("you are logged in", context);
        }
        else{
          _firebaseAuth.signOut();
              displayToastMessage("Invalid Email or Password please create an account or restore", context);
        }
      });
    }
    else{
      displayToastMessage("Cant to sigh in", context);
    }
  }
}
