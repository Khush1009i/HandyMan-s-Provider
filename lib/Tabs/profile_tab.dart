import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Header with profile image
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        'assets/provider.jpg',
                      ), // Replace with network or dynamic
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Arjun Patel",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Electrician",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.star, color: Colors.orange, size: 20),
                        SizedBox(width: 4),
                        Text("4.8", style: TextStyle(fontSize: 16)),
                        SizedBox(width: 10),
                        Text("•"),
                        SizedBox(width: 10),
                        Text("120+ Jobs", style: TextStyle(fontSize: 16)),
                        SizedBox(width: 10),
                        Text("•"),
                        SizedBox(width: 10),
                        Text("3 yrs Exp", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Contact Info
              _buildSectionTitle("Contact Info"),
              _buildInfoTile(Icons.phone, "Phone", "+91 9876543210"),
              _buildInfoTile(Icons.email, "Email", "arjun.patel@example.com"),

              const SizedBox(height: 20),

              // Location & Availability
              _buildSectionTitle("Work Info"),
              _buildInfoTile(Icons.location_on, "Base Location", "Vesu, Surat"),
              _buildInfoTile(
                Icons.schedule,
                "Available Time",
                "9:00 AM - 6:00 PM",
              ),

              const SizedBox(height: 20),

              // Skills & Specialties
              _buildSectionTitle("Specialties"),
              _buildChips([
                "Wiring",
                "Fan Installation",
                "Switchboard Repair",
                "LED Fitting",
              ]),

              const SizedBox(height: 30),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      // Edit profile action
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit Profile"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Logout logic
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text("Logout", style: TextStyle(color: Colors.white10),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget: section title
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper widget: info tile
  Widget _buildInfoTile(IconData icon, String label, String value) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0, right: 0),
      leading: Icon(icon, color: Colors.blue),
      title: Text(label),
      subtitle: Text(value),
    );
  }

  // Helper widget: chips
  Widget _buildChips(List<String> skills) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: skills
          .map(
            (skill) => Chip(
              label: Text(skill),
              backgroundColor: Colors.blue.shade50,
              labelStyle: const TextStyle(color: Colors.black87),
            ),
          )
          .toList(),
);
}
}
