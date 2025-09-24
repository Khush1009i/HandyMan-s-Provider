// import 'package:flutter/material.dart';
// import 'package:handyman_provider/Widgets/location_widget.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String selectedLocation;
//   final ValueChanged<String> onLocationChanged;

//   const CustomAppBar({
//     super.key,
//     required this.selectedLocation,
//     required this.onLocationChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 2,
//       automaticallyImplyLeading: false, // Remove default back button
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Logo and app name
//           Row(
//             children: [
//               Image.asset(
//                 'assets/images/logo.png',
//                 color: const Color.fromARGB(255, 0, 0, 255),
//                 height: 50,
//               ),
//               const Text(
//                 'ServEase',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 4, 0, 255),
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           // Location picker & notification
//           Row(
//             children: [
//               InkWell(
//                 onTap: () async {
//                   // Show the location dialog and get the result
//                   final result = await showDialog<String>(
//                     context: context,
//                     builder: (context) => LocationWidget(
//                       selectedLocation: selectedLocation,
//                       onLocationChanged: (loc) =>
//                           Navigator.of(context).pop(loc),
//                     ),
//                   );
//                   // If the result is non-null and different, update location
//                   if (result != null && result != selectedLocation) {
//                     onLocationChanged(result);
//                   }
//                 },
//                 child: Row(
//                   children: [
//                     const Icon(Icons.location_on, color: Colors.black),
//                     const SizedBox(width: 4),
//                     Text(
//                       selectedLocation,
//                       style: const TextStyle(color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 16),
//               IconButton(
//                 onPressed: () {
//                   // Handle notification tap
//                 },
//                 icon: const Icon(Icons.notifications_none),
//                 color: Colors.black,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
