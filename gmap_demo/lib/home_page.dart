import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(18.5247614, 73.7805658),
    zoom: 11,
  );

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Set<Marker> _markers = <Marker>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _markers.add(Marker(
        markerId: MarkerId("1"), position: LatLng(18.5247614, 73.7805658)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Google Map',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        compassEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        minMaxZoomPreference: MinMaxZoomPreference(8, 18),
        onTap: (LatLng? latLng) {
          if (latLng != null) {
            print("${latLng!.latitude}: ${latLng!.longitude}");
          }
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
