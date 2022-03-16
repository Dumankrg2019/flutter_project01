import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  GoogleMapController? _googleMapController;


  @override
  void initState() {
    //addMarkers();
    super.initState();
  }

  // void addMarkers() async {
  //   BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(),
  //     "/images/svg/flag_map.svg",
  //   );

  Marker flag = Marker(
      markerId: MarkerId('flag'),
    infoWindow: InfoWindow(title: 'This is flag'),
    // icon:  markerbitmap,
    position: LatLng(43.233527, 76.934869)
  );
  Marker? _destination;

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(43.229789, 76.901491),
              zoom: 10,
            ),
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            markers: {flag},
          )
        ],
      ),
    );
  }
}

