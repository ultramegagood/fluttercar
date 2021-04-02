import 'package:flutter/material.dart';
class SignUpScreen extends StatelessWidget {
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
                        print("Logged In Button");
                      },
                    )

                  ],
                ),
              ),

              FlatButton(
                onPressed:(){
                  print("clicked");
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
}
