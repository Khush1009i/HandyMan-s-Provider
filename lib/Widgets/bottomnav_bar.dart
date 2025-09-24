import 'package:flutter/material.dart';
import 'package:handyman_provider/Tabs/home_tab.dart';
import 'package:handyman_provider/Tabs/profile_tab.dart';
import 'package:handyman_provider/Tabs/request_tab.dart';
import 'package:handyman_provider/Widgets/app_bar.dart';
import 'package:handyman_provider/Tabs/booking_tab.dart';
import 'package:handyman_provider/Tabs/service_tab.dart';

class BottomNavbar extends StatefulWidget {
  final String selectedLocation;
  final ValueChanged<String> onLocationChanged;

  const BottomNavbar({
    super.key,
    required this.selectedLocation,
    required this.onLocationChanged,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  // All tabs, order matches navigation items
  final List<Widget> _tabs = const [
    HomeTab(),
    BookingsTab(),
    ServicesTab(),
    RequestTab(),
    ProfileScreen(),
  ];
  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showLogo: true,
        showBackButton: false,
        selectedLocation: widget.selectedLocation,
        onLocationChanged: widget.onLocationChanged,
        title: 'ServEase - HandyMan',
        showLocationIcon: true,
        showNotificationIcon: true,
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.miscellaneous_services), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
