import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_app/models/place_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

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
      zoomControlsEnabled: false,
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

  // Future<Uint8List> getImageFromRawData(String image, double width) async {
  //   var imageData = await rootBundle.load(image);
  //   var imageCodec = await ui.instantiateImageCodec(
  //       imageData.buffer.asUint8List(),
  //       targetWidth: width.round());
  //   var imageFrameInfo = await imageCodec.getNextFrame();
  //   var imageByteData =
  //       await imageFrameInfo.image.toByteData(format: ui.ImageByteFormat.png);
  //   return imageByteData!.buffer.asUint8List();
  // }

  void initMarkers() async {
    // var customIconMarker = BitmapDescriptor.bytes(
    //     await getImageFromRawData('assets/images/placeholder.png', 100));
    var customIconMarker = await BitmapDescriptor.asset(
        ImageConfiguration(size: Size(40, 40)),
        'assets/images/placeholder.png');
    var myMarker = places
        .map(
          (placesModel) => Marker(
            icon: customIconMarker,
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
    setState(() {});
  }
}

// world view 0 -> 3
// country view 4 -> 6
// city view 10 -> 12
// street view 13 -> 17
// building view 18 -> 20
