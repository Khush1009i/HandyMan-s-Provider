import 'package:flutter/material.dart';
import 'package:handyman_provider/Widgets/service_card.dart';

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {
        "title": "AC Installation",
        "category": "Appliances",
        "price": 499,
        "status": "Active",
      },
      {
        "title": "Tap Fixing",
        "category": "Plumbing",
        "price": 299,
        "status": "Inactive",
      },
      {
        "title": "Wiring Repair",
        "category": "Electrical",
        "price": 399,
        "status": "Active",
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
              "Your Services",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return ServiceCard(
                    title: service["title"] as String,
                    category: service["category"] as String,
                    price: service["price"] as int,
                    status: service["status"] as String,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new service logic here
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
