import 'package:flutter/material.dart';
import 'package:google_maps_app/widgets/custom_google_map.dart';

void main() {
  runApp(const TestGoogleMapsWithFlutter());
}

class TestGoogleMapsWithFlutter extends StatelessWidget {
  const TestGoogleMapsWithFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: const CustomGoogleMap());
  }
}