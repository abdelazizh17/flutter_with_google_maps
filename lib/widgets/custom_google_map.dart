import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;
  String? nightMapStyle;
  @override
  void initState() {
    initialCameraPosition = CameraPosition(
        zoom: 13, target: LatLng(26.559611633104257, 31.69568211049024));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      style: nightMapStyle,
      onMapCreated: (controller) {
        googleMapController = controller;
        initMapStyle();
      },
      initialCameraPosition: initialCameraPosition,
    );
  }

  void initMapStyle() async {
    nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/night_map_style.json');
    setState(() {});
  }
}

// world view 0 -> 3
// country view 4 -> 6
// city view 10 -> 12
// street view 13 -> 17
// building view 18 -> 20
