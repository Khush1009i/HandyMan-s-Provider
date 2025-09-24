import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationWidget extends StatefulWidget {
  final String selectedLocation;
  final ValueChanged<String> onLocationChanged;

  const LocationWidget({
    super.key,
    required this.selectedLocation,
    required this.onLocationChanged,
  });

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  final List<String> availableLocations = [
    'Ahmedabad, Gujarat',
    'Shree Ram Puram, Bangalore',
    'Hyderabad, Telangana',
    'Kochi, Kerala',
    'Jaipur, Rajasthan',
    'New Delhi, Delhi',
    'Mumbai, Maharashtra',
    'Bangalore, Karnataka',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Select Location",
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
      content: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on,
                      color: Colors.deepPurple, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Current: ${widget.selectedLocation}",
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: availableLocations.length,
                itemBuilder: (context, index) {
                  final location = availableLocations[index];
                  return ListTile(
                    title: Text(
                      location,
                      style: GoogleFonts.poppins(
                        color: location == widget.selectedLocation
                            ? Colors.deepPurple
                            : Colors.black87,
                        fontWeight: location == widget.selectedLocation
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                    trailing: location == widget.selectedLocation
                        ? const Icon(Icons.check, color: Colors.deepPurple)
                        : null,
                    onTap: () {
                      widget.onLocationChanged(location); 
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Cancel closes dialog
          },
          child: Text(
            "Cancel",
            style: GoogleFonts.poppins(color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }
}
