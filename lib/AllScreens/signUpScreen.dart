import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/AllScreens/loginScreen.dart';
import 'package:firstproject/AllScreens/mainscreen.dart';
import 'package:firstproject/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SignUpScreen extends StatelessWidget
{
  static const String idScreen ="register";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
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
              SizedBox(height: 25.0,),
              Image(image: AssetImage("images/logo.png"),
                width:390.0,
                height:250.0 ,
                alignment: Alignment.center,),
              SizedBox(height: 1.0,),
              Text(
                  "Sign Up as rider",
                  style: TextStyle(fontSize: 24.0, fontFamily: "Brand-Regular"),
                  textAlign: TextAlign.center
              ),

              Padding(padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 1.0,),
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Name",
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
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone",
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
                            "Sign Up account",
                            style: TextStyle(fontSize: 10.0,fontFamily: "Brand Bold"),

                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: (){
                        if(nameTextEditingController.text.length<3){
                          displayToastMessage("Name must be least 3  characters", context);
                        }
                        else if(!emailTextEditingController.text.contains("@")){
                          displayToastMessage("Email address not valid", context);
                        }
                        else if(phoneTextEditingController.text.isEmpty){
                          displayToastMessage("Phone is incorrect", context);
                        }
                        else if(passwordTextEditingController.text.length<8){
                          displayToastMessage("minimum 8 character ", context);
                        }
                        else{
                          registerNewUser(context);
                        }
                      },
                    )

                  ],
                ),
              ),

              FlatButton(
                onPressed:(){
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
                },
                child: Text(
                  "Already have an account?",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  registerNewUser(BuildContext context)async
  {
    final User firebaseUser= (await _firebaseAuth.createUserWithEmailAndPassword(email: emailTextEditingController.text, password: passwordTextEditingController.text).catchError((errorMsg){displayToastMessage("Error: "+errorMsg.toString(), context);})).user;
    if(firebaseUser!=null)
      {

        Map userDataMap={
          "name": nameTextEditingController.text.trim(),
          "email": emailTextEditingController.text.trim(),
          "phone": phoneTextEditingController.text.trim(),
        };
        usersRef.child(firebaseUser.uid).set(userDataMap);
        displayToastMessage("Account was been created", context);
        Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
      }
    else{
    displayToastMessage("User not be created", context);
    }
  }

}
displayToastMessage(String message,BuildContext context) {
  Fluttertoast.showToast(msg: message);
}