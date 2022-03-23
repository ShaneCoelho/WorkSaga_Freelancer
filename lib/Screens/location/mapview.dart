// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worksaga_freelancer/Widgets/navbar.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

Future<void> location(double longitude, double latitude, String pincode,
    String country, String locality) async {
  final response = await http.post(
    Uri.parse('https://worksaga.herokuapp.com/api/freelancerprofile/test'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'longitude': longitude,
      'latitude': latitude,
      'pincode': pincode,
      'country': country,
      'city': locality,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

    final responseJson = jsonDecode(response.body).cast<Map<String, dynamic>>();
    print(responseJson);

    final prefs = await SharedPreferences.getInstance();

// set value
    prefs.setString('auth-token', responseJson);
  } else if (response.statusCode == 400) {
    print(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create data.');
  }
}

class _MapViewState extends State<MapView> {
  late GoogleMapController googleMapController;

  static const initialCamerasPosition = CameraPosition(
    target: LatLng(20.5937, 78.9629),
    zoom: 0,
  );

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFEFEFEF),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional(-0.25, 1),
              children: [
                GoogleMap(
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: initialCamerasPosition,
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                  myLocationEnabled: true,
                  zoomGesturesEnabled: true,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFFCBDEED),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                              child: Container(
                                  width: 250,
                                  height: 40,
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      Position position =
                                          await _determinePosition();
                                      googleMapController.animateCamera(
                                          CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                  target: LatLng(
                                                      position.latitude,
                                                      position.longitude),
                                                  zoom: 14)));
                                      print(position);
                                      List<Placemark> placemarks =
                                          await placemarkFromCoordinates(
                                              position.latitude,
                                              position.longitude);
                                      // print(placemarks);
                                      var pincode = placemarks[0].postalCode;
                                      var country = placemarks[0].country;
                                      var city = placemarks[0].locality;
                                      location(
                                          position.longitude,
                                          position.latitude,
                                          pincode!,
                                          country!,
                                          city!);
                                      print(placemarks[1]);
                                      Navigator.pushReplacement(
                                        
                                          context,
                                          MaterialPageRoute(
                                            
                                              builder: (context) => Navbar()));
                                    },
                                    icon: Icon(Icons
                                        .gps_fixed_outlined), //icon data for elevated button
                                    label:
                                        Text("Current Location"), //label text
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height: 59,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFCBDEED),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0,
                                        color: Color(0x4E000000),
                                        offset: Offset(0, 0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Color(0xFF182A42),
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6, 0, 0, 0),
                                              child: Icon(
                                                Icons.search_rounded,
                                                color: Color(0xFF182A42),
                                                size: 22,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(6, 0, 0, 0),
                                                child: TextFormField(
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Location',
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color.fromARGB(
                                                        255, 12, 40, 77),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
