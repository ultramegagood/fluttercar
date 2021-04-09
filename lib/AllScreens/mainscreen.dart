import 'dart:async';

import 'package:firstproject/Widgets/Divider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MainScreen extends StatefulWidget
{
  static const String idScreen ="Main Screen";


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Completer<GoogleMapController> _controllerGM = Completer();
  GoogleMapController newGoogleMapController;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("MainScreen")
        ),
        body: Stack(
        children: [
          GoogleMap(mapType: MapType.normal,
      myLocationButtonEnabled: true,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller){
        _controllerGM.complete(controller);
        newGoogleMapController=controller;
    },

    ),

          Positioned(

            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 320.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:BorderRadius.only(topLeft: Radius.circular(15.0),topRight:Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7,0.7),

                  )

                ]


              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    SizedBox(height: 6.0,),
                    Text("Need some wheels? ", style: TextStyle(fontSize: 12.0),),
                    Text("drive to? ", style: TextStyle(fontSize: 20.0, fontFamily: "Brand-Bold"),),
                    SizedBox(height: 25.0,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 6.0,
                              spreadRadius: 0.5,
                              offset: Offset(0.7,0.7),

                            )

                          ]


                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.blueAccent,),
                            SizedBox(width: 10.0,),
                            Text("Search drop location")

                          ],

                        ),
                      ),

                    ),
                    SizedBox(height: 24.0,),
                    Row(
                      children: [
                        Icon(Icons.home, color:  Colors.grey,),
                        SizedBox(width: 12.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("add point location"),
                            SizedBox(height: 4.0,),
                            Text("my home", style: TextStyle(color: Colors.black54, fontSize: 12.0),)
                          ],

                        )
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    DividerWidget(),
                    SizedBox(height: 16.0,),
                    Row(
                      children: [
                        Icon(Icons.work, color:  Colors.grey,),
                        SizedBox(width: 12.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("add point work location"),
                            SizedBox(height: 4.0,),
                            Text("My office", style: TextStyle(color: Colors.black54, fontSize: 12.0),)
                          ],

                        )
                      ],
                    )


                  ],
                ),
              ),

            ),

          )
      ],
    ),
    );

  }
}
