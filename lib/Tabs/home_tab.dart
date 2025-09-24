import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> services = ['AC Repair', 'Plumbing', 'Electrical'];
  List<Map<String, String>> bookings = [
    {
      'customerName': 'Amit Sharma',
      'dateTime': '20 July, 10:00 AM',
      'service': 'AC Service',
    },
    {
      'customerName': 'Seema Rao',
      'dateTime': '22 July, 9:00 AM',
      'service': 'Plumbing',
    },
    {
      'customerName': 'Rahul Kumar',
      'dateTime': '24 July, 2:30 PM',
      'service': 'Electrical',
    },
  ];

  List<Map<String, String>> requests = [
    {
      'customerName': 'Priya Patel',
      'location': 'Vesu, Surat',
      'service': 'Plumbing',
    },
    {
      'customerName': 'Manish Mehta',
      'location': 'Adajan, Surat',
      'service': 'AC Repair',
    },
    {
      'customerName': 'Priya Patel',
      'location': 'Vesu, Surat',
      'service': 'Plumbing',
    },
    {
      'customerName': 'Manish Mehta',
      'location': 'Adajan, Surat',
      'service': 'AC Repair',
    },
    {
      'customerName': 'Priya Patel',
      'location': 'Vesu, Surat',
      'service': 'Plumbing',
    },
    {
      'customerName': 'Manish Mehta',
      'location': 'Adajan, Surat',
      'service': 'AC Repair',
    },
  ];

  void _addService() async {
    String? newService = await showDialog<String>(
      context: context,
      builder: (ctx) {
        final controller = TextEditingController();
        return AlertDialog(
          title: const Text("Add Service"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Service Name'),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(ctx),
            ),
            ElevatedButton(
              child: const Text("Add"),
              onPressed: () {
                final name = controller.text.trim();
                if (name.isNotEmpty) Navigator.pop(ctx, name);
              },
            ),
          ],
        );
      },
    );
    if (newService != null && newService.isNotEmpty) {
      setState(() {
        services.add(newService);
      });
    }
  }

  void _removeService(int index) {
    setState(() {
      services.removeAt(index);
    });
  }

  void _acceptRequest(int index) {
    setState(() {
      requests.removeAt(index);
      // Optionally show a snackbar or move to bookings list.
    });
  }

  void _declineRequest(int index) {
    setState(() {
      requests.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome
            const Text(
              "Welcome Back, Provider 👋",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Your Services
            const Text(
              "Your Services",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  // Service pills
                  for (int i = 0; i < services.length; i++)
                    Chip(
                      backgroundColor: Colors.blue[50],
                      label: Text(
                        services[i],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      deleteIcon: const Icon(Icons.close, size: 18),
                      onDeleted: () => _removeService(i),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  // Add new service chip/button
                  GestureDetector(
                    onTap: _addService,
                    child: Chip(
                      backgroundColor: Colors.green[50],
                      label: const Icon(Icons.add, color: Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Upcoming Bookings (horizontal scrollable cards, NOT slidable)
            const Text(
              "Upcoming Bookings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 170,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: bookings.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final b = bookings[i];
                  return SizedBox(
                    width: 200,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.calendar_today, color: Colors.blue),
                                const SizedBox(width: 10),
                                Text(
                                  b['service']!,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              b['customerName']!,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              b['dateTime']!,
                              style: const TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Requests (slide for accept/decline)
           const Text(
  "New Service Requests",
  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
),
const SizedBox(height: 10),
SizedBox(
  height: 180,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: requests.length,
    separatorBuilder: (_, __) => const SizedBox(width: 14),
    itemBuilder: (context, i) {
      final r = requests[i];
      return Container(
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: Text(
                r['customerName']![0],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              r['customerName']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              r['location']!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Container(
              margin: const EdgeInsets.only(top: 2, bottom: 5),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                r['service']!,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue[800],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      textStyle: const TextStyle(fontSize: 13),
                      minimumSize: const Size(0, 32),
                    ),
                    onPressed: () {
                      setState(() {
                        requests.removeAt(i);
                        // Optionally: add to bookings if needed
                      });
                    },
                    child: const Text("Accept"),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: const BorderSide(color: Colors.red),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      textStyle: const TextStyle(fontSize: 13),
                      minimumSize: const Size(0, 32),
                    ),
                    onPressed: () {
                      setState(() {
                        requests.removeAt(i);
                      });
                    },
                    child: const Text("Decline"),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  ),
),

            const SizedBox(height: 20),

            // Ratings
            const Text(
              "Your Ratings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 28),
                  SizedBox(width: 10),
                  Text(
                    "4.8 / 5.0 (120 reviews)",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
