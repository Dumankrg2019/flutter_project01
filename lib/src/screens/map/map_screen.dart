
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  GoogleMapController? _googleMapController;
  BitmapDescriptor?  mapMarker;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'images/png/flag_map.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
          Marker(
            markerId: MarkerId('id-1'),
            position: LatLng(43.233423, 76.934423),
            icon: mapMarker!,
            infoWindow: InfoWindow(title: 'This is flag'),
          )
      );
    });
  }


  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Stack(
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(43.233527, 76.934869),
                    zoom: 15,
                  ),
                  markers: _markers,
                  mapType: MapType.normal,
                  zoomControlsEnabled: true,
                  mapToolbarEnabled: true,
                  myLocationEnabled: true,
                  zoomGesturesEnabled: true,
                  myLocationButtonEnabled: true,
                  scrollGesturesEnabled: true,
                ),
              ),
              ]
            ),
            Positioned(
              bottom: 80,
              right: -20,
              child: MaterialButton(
                onPressed: () {
                  print('click from map');
                },
                child: SvgPicture.asset(
                  'images/svg/current_geo.svg'
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}

