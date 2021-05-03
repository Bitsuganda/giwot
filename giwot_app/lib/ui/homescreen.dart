import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:giwot_app/ui/waiting_city_drive.dart';
import 'package:giwot_app/models/Functions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(


      body: SafeArea(

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width*1.0,
              height: MediaQuery.of(context).size.height*1.0,
              child:Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0),),
                  Text(
                    'Choose a Service',
                    style: TextStyle(
                        color: HexColor("#0080FF"),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),),

                  Padding(padding: EdgeInsets.all(10.0),),
                  Row(

                    children: <Widget>[

                      Expanded(
                        child:   GestureDetector(onTap:(){
                          print("Clicked City Drive");
                          try{
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>WaitingCityDrive()));
                          }catch(e){
                            rethrow;
                          }
                        },
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 160.0,
                                  width: 160.0,
                                  child: Stack(
                                    children: <Widget>[

                                      Container(

                                        child:
                                        Icon(Icons.local_taxi,
                                          size: 130.0,
                                          color: HexColor("#0080FF"),
                                        ),

                                      ),
                                      Positioned(
                                        bottom: 10.0,
                                        right: 50.0,
                                        child: Text("City Drive",
                                          style: TextStyle(
                                              color: HexColor("#000000"),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),),
                                    ],
                                  ),

                                ),
                              ],
                            ),

                          ),
                        ),
                      ),




                      Padding(padding: EdgeInsets.all(2.0),),

                      Expanded(child:
                      GestureDetector(onTap:(){
                        print("Clicked City Ride");
                      }, child:
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 160.0,
                              width: 160.0,
                              child: Stack(
                                children: <Widget>[
                                  Container(

                                    child:
                                    Icon(Icons.pedal_bike,
                                      size: 130.0,
                                      color: HexColor("0080FF"),
                                    ),

                                  ),
                                  Positioned(
                                    bottom: 10.0,
                                    left: 50.0,
                                    child: Text("City Ride",
                                      style: TextStyle(
                                          color: HexColor("#000000"),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),),
                                ],
                              ),

                            ),
                          ],
                        ),

                      ),
                      ),),

                    ],
                  ),
                  Padding(padding: EdgeInsets.all(5.0),),
                  Row(
                    children: <Widget>[
                      Expanded(child:
                      GestureDetector(onTap:(){
                        print("Clicked Delivery");
                      }, child:
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 160.0,
                              width: 160.0,
                              child: Stack(
                                children: <Widget>[
                                  Container(

                                    child:
                                    Icon(Icons.delivery_dining,
                                      size: 130.0,
                                      color: HexColor("0080FF"),
                                    ),

                                  ),
                                  Positioned(
                                    bottom: 10.0,
                                    right: 50.0,
                                    child: Text("Delivery ",
                                      style: TextStyle(
                                          color: HexColor("#000000"),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),),
                                ],
                              ),

                            ),
                          ],
                        ),

                      ),),
                      ),

                      Padding(padding: EdgeInsets.all(2.0),),

                      Expanded(child:
                      GestureDetector(onTap:(){
                        print("Clicked Special Hire");
                      }, child:
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 160.0,
                              width: 160.0,
                              child: Stack(
                                children: <Widget>[
                                  Container(

                                    child:
                                    Icon(Icons.directions_bus_rounded,
                                      size: 130.0,
                                      color: HexColor("0080FF"),
                                    ),

                                  ),
                                  Positioned(
                                    bottom: 10.0,
                                    right: 40.0,
                                    child: Text("Special Hire",
                                      style: TextStyle(
                                          color: HexColor("#000000"),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),),
                                ],
                              ),

                            ),
                          ],
                        ),

                      ),),
                      ),

                    ],
                  ),
                  Padding(padding: EdgeInsets.all(5.0),),
                  Row(
                    children: <Widget>[
                      Expanded(child:
                      GestureDetector(onTap:(){
                        print("Clicked Kampala Gulu ");
                      },child:
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 160.0,
                              width: 160.0,
                              child: Stack(
                                children: <Widget>[

                                  Container(

                                    child:
                                    Icon(Icons.directions_bus_rounded,
                                      size: 120.0,
                                      color: HexColor("0080FF"),
                                    ),

                                  ),

                                  Positioned(
                                    bottom: 10.0,
                                    right: 20.0,
                                    child: Text("Kampala - Gulu",
                                      style: TextStyle(
                                          color: HexColor("#000000"),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),),

                                ],
                              ),

                            ),
                          ],
                        ),

                      ),
                      ),
                      ),

                      Padding(padding: EdgeInsets.all(2.0),),

                      Expanded(child:
                      GestureDetector(onTap:(){
                        print("Clicked Gulu Kampala");
                      },child:
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 160.0,
                              width: 160.0,
                              child: Stack(
                                children: <Widget>[
                                  Container(

                                    child:
                                    Icon(Icons.directions_bus_outlined,
                                      size: 130.0,
                                      color: HexColor("0080FF"),
                                    ),

                                  ),
                                  Positioned(
                                    bottom: 10.0,
                                    right: 30.0,
                                    child: Text("Gulu-Kampala",
                                      style: TextStyle(
                                          color: HexColor("#000000"),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),),
                                ],
                              ),

                            ),
                          ],
                        ),

                      ),
                      ),),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(9.0),),


                  Positioned(
                    bottom: 40,
                    right: 5.0,

                    child: Card(
                      elevation: 8,
                      color: HexColor("#0080FF"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),

                      child: Container(child:

                      Row(children: <Widget>[

                        Padding(padding: EdgeInsets.all(15.0),),
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.all(5.0),),
                            GestureDetector(onTap:(){
                              print("Clicked History");
                            },child:
                            Icon(
                              Icons.watch_later,
                              color: HexColor("#ffffff"),
                              size: 46.0,
                            ),),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(15.0),),
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.all(5.0),),
                            GestureDetector(onTap:(){
                              print("Clicked Profile");
                            },child:
                            Icon(
                              Icons.person_pin,
                              color: HexColor("#ffffff"),
                              size: 46.0,
                            ),),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(25.0),),
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.all(0.0),),
                            Container(child:
                            GestureDetector(onTap:(){
                              print("Clicked Home");
                            },
                              child:Icon(
                                Icons.home,
                                color: HexColor("#ffffff"),
                                size: 60.0,
                              ),),



                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(15.0),),
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.all(5.0),),
                            GestureDetector(onTap:(){
                              print("Clicked Maps");
                            },child:
                            Icon(
                              Icons.map_outlined,
                              color: HexColor("#ffffff"),
                              size: 46.0,
                            ),),
                          ],
                        ),
                      ],

                      ),




                          width: 360, height: 60),

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
