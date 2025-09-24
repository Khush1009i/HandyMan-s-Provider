import 'package:flutter/material.dart';
import 'package:handyman_provider/Widgets/request_card.dart';

class RequestTab extends StatelessWidget {
  const RequestTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> requests = [
      {
        'name': 'Raj Mehta',
        'service': 'AC Repair',
        'location': 'Vesu, Surat',
        'time': 'Today, 3:00 PM',
      },
      {
        'name': 'Sneha Patel',
        'service': 'Plumbing',
        'location': 'Adajan, Surat',
        'time': 'Tomorrow, 11:00 AM',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "New Service Requests",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  final request = requests[index];
                  return RequestCard(
                    name: request['name']!,
                    service: request['service']!,
                    location: request['location']!,
                    time: request['time']!,
                  );
                },
              ),
            ),
          ],
        ),
     ),
);
}
}
