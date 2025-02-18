import 'package:flutter/material.dart';
import 'package:google_maps_app/models/place_model.dart';
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
    initMarkers();
    super.initState();
  }

  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
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

  void initMarkers() {
    var myMarker = places
        .map(
          (placesModel) => Marker(
            infoWindow: InfoWindow(
              title: placesModel.name,
            ),
            position: placesModel.latLng,
            markerId: MarkerId(
              placesModel.id.toString(),
            ),
          ),
        )
        .toSet();
    markers.addAll(myMarker);
  }
}

// world view 0 -> 3
// country view 4 -> 6
// city view 10 -> 12
// street view 13 -> 17
// building view 18 -> 20
