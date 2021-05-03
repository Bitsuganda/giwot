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

// Starting point latitude
double _originLatitude = 6.5212402;
// Starting point longitude
double _originLongitude = 3.3679965;

class _WaitingCityDriveState extends State<WaitingCityDrive> {
// Destination latitude
  double _destLatitude = 6.849660;
// Destination Longitude
  double _destLongitude = 3.648190;
// Markers to show points on the map
  Map<MarkerId, Marker> markers = {};

  // PolylinePoints polylinePoints = PolylinePoints();

  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};

  Completer<GoogleMapController> _controller = Completer();
  // Configure map position and zoom
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(_originLatitude, _originLongitude),
    zoom: 9.4746,
  );

  @override
  void initState() {
    // TODO: implement initState
    /// add origin marker origin marker
    _addMarker(
      LatLng(_originLatitude, _originLongitude),
      "origin",
      BitmapDescriptor.defaultMarker,
    );
    // Add destination marker
    _addMarker(
      LatLng(_destLatitude, _destLongitude),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
    );
    _getPolyline();
    super.initState();
  }

  // This method will add markers to the map based on the LatLng position
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDVcdsP6R-OVglMlal5kA3TFWm-OCbK9xE",
      PointLatLng(_originLatitude, _originLongitude),
      PointLatLng(_destLatitude, _destLongitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          color: HexColor("#e0efff"),
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 1.0,
                          child:
                              // GoogleMap(
                              //   initialCameraPosition: _Kampala,
                              //     mapType: MapType.normal,
                              //    onMapCreated: (GoogleMapController controler){
                              //     _controller.complete(controler);

                              GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: _kGooglePlex,
                            myLocationEnabled: true,
                            tiltGesturesEnabled: true,
                            compassEnabled: true,
                            scrollGesturesEnabled: true,
                            zoomGesturesEnabled: true,
                            polylines: Set<Polyline>.of(polylines.values),
                            markers: Set<Marker>.of(markers.values),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          ),
                        ),
                      ),

                      //title card
                      Positioned(
                        top: 40.0,
                        left: MediaQuery.of(context).size.width * 0.25,
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.white,
                          child: SizedBox(
                            height: 60.0,
                            width: 160.0,
                            child: Center(
                              child: Text(
                                "City Drive",
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
                        right: MediaQuery.of(context).size.width * 0.25,
                        child: Card(
                          elevation: 9.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0)),
                          color: Colors.white,
                          child: SizedBox(
                            height: 30.0,
                            width: 200.0,
                            child: Center(
                              child: Text(
                                "TODAY 17 May 2021",
                                style: TextStyle(
                                    color: HexColor("#00000f"), fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Stop Button
                      Positioned(
                        bottom: 200.0,
                        right: MediaQuery.of(context).size.width * 0.40,
                        child: GestureDetector(
                          onTap: () {
                            print("hey tapped stop button");
                          },
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            color: HexColor("#0080ff"),
                            child: SizedBox(
                              height: 80.0,
                              width: 80.0,
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                color: Colors.white,
                                child: SizedBox(
                                  height: 70.0,
                                  width: 70.0,
                                  child: Card(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    color: HexColor("#0080FF"),
                                    child: SizedBox(
                                      height: 60.0,
                                      width: 60.0,
                                      child: Center(
                                        child: Text(
                                          "Stop",
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
                          ),
                        ),
                      ),

                      //call button
                      Positioned(
                        bottom: 170.0,
                        right: 20.0,
                        child: FloatingActionButton(
                          backgroundColor: HexColor("#ffffff"),
                          onPressed: () {},
                          child: Icon(
                            Icons.call,
                            color: HexColor("#0080FF"),
                          ),
                        ),
                      ),
                      //bottom sheet card top
                      Positioned(
                        bottom: 90.0,
                        right: 0.0,
                        child: Card(
                          elevation: 9.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.white,
                          child: SizedBox(
                            height: 70.0,
                            width: MediaQuery.of(context).size.width * 1.0,
                            child: Center(
                              child: Text(
                                "Finding Driver",
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
                        child: Card(
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
                        child: Card(
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
                        child: Card(
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
                            width: MediaQuery.of(context).size.width * 1.0,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(4.0),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10.0),
                                            ),
                                            Text(
                                              "Please wait",
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
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                    ),
                                    Text(
                                      "Waiting for driver to confirm your request",
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
        ),
        onWillPop: () {
          ConfirmCancelDriveRequest();
        });
  }
}
