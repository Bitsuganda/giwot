import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:giwot_app/models/Functions.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';




class WaitingCityDrive extends StatefulWidget {
  @override
  _WaitingCityDriveState createState() => _WaitingCityDriveState();
}



class _WaitingCityDriveState extends State<WaitingCityDrive> {
  Completer _controller = Completer();
  static final CameraPosition _Kampala = CameraPosition(
    target: LatLng(0.347596, 32.582520),
    zoom: 7.0,
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: Container(
              width: MediaQuery.of(context).size.width*1.0,
              height: MediaQuery.of(context).size.height*1.0,
              child: Stack(
                children: <Widget>[
                  Positioned(

                    child: Container(

                      color: HexColor("#e0efff"),
                      width: MediaQuery.of(context).size.width*1.0,
                      height: MediaQuery.of(context).size.height*1.0,
                      child:
                      GoogleMap(
                        initialCameraPosition: _Kampala,
                        mapType: MapType.normal,
                        onMapCreated: (GoogleMapController controler){
                          _controller.complete(controler);



                        },
                      ),

                    ),),

                  //title card
                  Positioned(
                    top: 40.0,
                    left: MediaQuery.of(context).size.width*0.25,
                    child:
                    Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.white,
                      child: SizedBox(
                        height: 60.0,
                        width: 160.0,

                        child:Center(
                          child:Text("City Drive",
                            style: TextStyle(
                                color: HexColor("#0080FF"),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ),

                    ),
                  ),
                  //Date Card
                  Positioned(
                    top: 120.0,
                    right: MediaQuery.of(context).size.width*0.25,
                    child:
                    Card(
                      elevation: 9.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0)),
                      color: Colors.white,
                      child: SizedBox(
                        height: 30.0,
                        width: 200.0,

                        child:Center(
                          child:Text("TODAY 17 May 2021",
                            style: TextStyle(
                                color: HexColor("#00000f"),

                                fontSize: 16),
                          ),
                        ),
                      ),

                    ),
                  ),
                  //Stop Button
                  Positioned(
                    bottom: 200.0,
                    right: MediaQuery.of(context).size.width*0.40,
                    child:  GestureDetector(onTap: (){
                      print("hey tapped stop button");
                    },
                      child:Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: HexColor("#0080ff"),
                        child: SizedBox(
                          height: 80.0,
                          width: 80.0,

                          child:Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            color: Colors.white,
                            child: SizedBox(
                              height: 70.0,
                              width: 70.0,

                              child:Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                color: HexColor("#0080FF"),
                                child: SizedBox(
                                  height: 60.0,
                                  width: 60.0,

                                  child:Center(
                                    child:Text("Stop",
                                      style: TextStyle(
                                          color: HexColor("#ffffff"),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                ),

                              ),
                            ),

                          ),
                        ),

                      ),),),

                  //call button
                  Positioned(
                    bottom: 170.0,
                    right: 20.0,
                    child: FloatingActionButton(
                      backgroundColor: HexColor("#ffffff"),
                      onPressed: (){

                      },child: Icon(

                      Icons.call,
                      color: HexColor("#0080FF"),
                    ),),),
                  //bottom sheet card top
                  Positioned(
                    bottom: 90.0,
                    right: 0.0,
                    child:
                    Card(
                      elevation: 9.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.white,
                      child: SizedBox(
                        height: 70.0,
                        width:  MediaQuery.of(context).size.width*1.0,

                        child:Center(
                          child:Text("Finding Driver",
                            style: TextStyle(
                                color: HexColor("#00000f"),
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                        ),
                      ),

                    ),
                  ),
                  //blue gap clear fix Right(white)
                  Positioned(
                    bottom: 90.0,
                    right: 0.0,
                    child:
                    Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      color: HexColor("#ffffff"),
                      child: SizedBox(
                        height: 20.0,
                        width: 80.0,


                      ),

                    ),
                  ),
                  //blue dash right corner
                  Positioned(
                    bottom: 90.0,
                    right: 30.0,
                    child:
                    Card(
                      elevation: 9.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      color: HexColor("#0080ff"),
                      child: SizedBox(
                        height: 5.0,
                        width: 60.0,


                      ),

                    ),
                  ),
                  //blue gap clear fix left
                  Positioned(
                    bottom: 90.0,
                    right: 342,
                    child:
                    Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      color: HexColor("#ffffff"),
                      child: SizedBox(
                        height: 9.0,
                        width: 60.0,


                      ),

                    ),
                  ),

                  //bottom sheet card  bottom
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      color: HexColor("#dadee3"),


                      child: Container(
                        height: 90.0,
                        width: MediaQuery.of(context).size.width*1.0,
                        child:Column(
                          children: [
                            Row(

                              children: [
                                Column(
                                  children: [
                                    Padding(padding: EdgeInsets.all(4.0),),
                                    Row(
                                      children: [
                                        Padding(padding: EdgeInsets.all(10.0),),
                                        Text("Please wait",
                                          style: TextStyle(
                                              color: HexColor("#0080ff"),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 26),
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.all(10.0),),
                                Text("Waiting for driver to confirm your request",
                                  style: TextStyle(
                                      color: HexColor("#7f7f7f"),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ),

                  ),


                ],
              ),

            ),
          ),
        ),
      ),

    ), onWillPop: (){
      ConfirmCancelDriveRequest();
    });
  }
}
