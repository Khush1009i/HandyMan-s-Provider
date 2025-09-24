import 'package:flutter/material.dart';
import 'package:handyman_provider/data/booking_item.dart';

// If BookingItem is a widget, this assumes it's imported from data/booking_item.dart

class BookingsTab extends StatelessWidget {
  const BookingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            'Your Bookings',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          // Upcoming Bookings Section
          Text(
            'Upcoming',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          BookingItem(
            customerName: 'Ravi Patel',
            serviceName: 'AC Service',
            date: '20 July, 10:00 AM',
            status: 'Confirmed',
          ),
          BookingItem(
            customerName: 'Neha Desai',
            serviceName: 'Plumbing Repair',
            date: '22 July, 2:30 PM',
            status: 'Pending',
          ),

          SizedBox(height: 20),

          // Past Bookings Section
          Text(
            'Past Bookings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          BookingItem(
            customerName: 'Karan Mehta',
            serviceName: 'Electrician',
            date: '10 July, 5:00 PM',
            status: 'Completed',
          ),
          BookingItem(
            customerName: 'Sneha Shah',
            serviceName: 'Laundry Pickup',
            date: '8 July, 11:00 AM',
            status: 'Completed',
          ),
        ],
      ),
    );
  }
}
