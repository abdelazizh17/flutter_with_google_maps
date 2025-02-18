import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlaceModel({required this.id, required this.name, required this.latLng});

}


  List<PlaceModel> places = [
    PlaceModel(
      id: 1,
      name: 'الخلاط',
      latLng: LatLng(26.55971928638476, 31.69532764981553),
    ),
    PlaceModel(
      id: 2,
      name: 'بيسكا',
      latLng: LatLng(26.558372848002723, 31.697769240470894),
    ),
    PlaceModel(
      id: 3,
      name: 'ديوان الشام',
      latLng: LatLng(26.560573582780037, 31.697629818336054),
    ),
  ];