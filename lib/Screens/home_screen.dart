import 'package:flutter/material.dart';
import 'package:handyman_provider/Widgets/bottomnav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLocation = "selectedLocation";

  void _updateLocation(String newLocation) {
    setState(() {
      selectedLocation = newLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavbar(
        selectedLocation: selectedLocation,
        onLocationChanged: _updateLocation,
      ),
    );
  }
}
