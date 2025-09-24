import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final String name;
  final String service;
  final String location;
  final String time;

  const RequestCard({
    super.key,
    required this.name,
    required this.service,
    required this.location,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, color: Colors.blue),
                const SizedBox(width: 8),
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.build, size: 18),
                const SizedBox(width: 6),
                Text(service),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on, size: 18),
                const SizedBox(width: 6),
                Text(location),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.schedule, size: 18),
                const SizedBox(width: 6),
                Text(time),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // reject logic
                  },
                  style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                  child: const Text("Reject"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // accept logic
                  },
                  child: const Text("Accept"),
                ),
              ],
            ),
          ],
        ),
     ),
);}
}
