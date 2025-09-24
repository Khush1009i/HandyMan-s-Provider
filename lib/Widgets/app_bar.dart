import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handyman_provider/Widgets/location_widget.dart';
import 'package:handyman_provider/screens/home_screen.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  // final Color appBarForegroundColor;
  final String selectedLocation;
  final Function(String) onLocationChanged;
  final String title;
  final bool showBackButton;
  final bool showLogo;
  final bool showLocationIcon;
  final bool showNotificationIcon;

  const AppBarWidget({
    super.key,
    // required this.appBarForegroundColor,
    required this.selectedLocation,
    required this.onLocationChanged,
    required this.title,
    this.showBackButton = false,
    this.showLogo = true,
    this.showLocationIcon = true,
    this.showNotificationIcon = true,
  });

  Widget _buildBoxIcon(IconData icon, VoidCallback onTap, Color iconColor, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =  Colors.white;
    final iconColor =  Colors.deepPurple;

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 1,
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: iconColor),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                );
              },
              tooltip: 'Back to Home',
            )
          : null,
      titleSpacing: 0,
      title: Row(
        children: [
          if (showLogo)
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 6),
              child: Image.asset(
                'assets/images/logo.png',
                height: 55,
                color: iconColor,
              ),
            ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: iconColor,
            ),
          ),
        ],
      ),
      actions: [
        if (showLocationIcon)
          _buildBoxIcon(
            Icons.location_on,
            () => showDialog(
              context: context,
              builder: (_) => LocationWidget(
                selectedLocation: selectedLocation,
                onLocationChanged: (newLoc) {
                  onLocationChanged(newLoc);
                },
              ),
            ),
            iconColor,
            context,
          ),
        if (showNotificationIcon)
          _buildBoxIcon(
            Icons.notifications,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HomeScreen()),
            ),
            iconColor,
            context,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
