import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String category;
  final int price;
  final String status;

  const ServiceCard({
    super.key,
    required this.title,
    required this.category,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = status.toLowerCase() == 'active'
        ? Colors.green
        : Colors.redAccent;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.build_circle, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text("$category • ₹$price"),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () {
                // Toggle status or open edit
              },
              child: const Text(
                "Edit",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
     ),
);
}
}
