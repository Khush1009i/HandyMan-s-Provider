import 'dart:math';
import 'package:flutter/material.dart';
import 'package:handyman_provider/Screens/home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String generatedOtp;
  final String userEmail;
  final String userPhone;

  const OtpScreen({
    super.key,
    required this.generatedOtp,
    required this.userEmail,
    required this.userPhone,
  });

  @override
  State<OtpScreen> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isOtpEntered = false;
  String _currentOtp = '';

  @override
  void initState() {
    super.initState();
    _currentOtp = widget.generatedOtp;
    _otpController.addListener(_onOtpChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showOtpPopup(widget.generatedOtp);
    });
  }

  @override
  void dispose() {
    _otpController.removeListener(_onOtpChanged);
    _otpController.dispose();
    super.dispose();
  }

  void _onOtpChanged() {
    setState(() {
      _isOtpEntered = _otpController.text.isNotEmpty;
    });
  }

  void _showOtpPopup(String otp) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.sms, color: Colors.deepPurpleAccent, size: 40),
            const SizedBox(height: 10),
            Text(
              'Your OTP is: $otp',
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) Navigator.of(context, rootNavigator: true).pop();
    });
  }

  void _verifyOtp() {
    if (_otpController.text == _currentOtp) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false, // Remove all previous routes
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Incorrect OTP, try again')));
    }
  }

  void _resendOtp() {
    String newOtp = (1000 + Random().nextInt(9000)).toString();
    _currentOtp = newOtp;
    _otpController.clear();
    _showOtpPopup(newOtp);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('New OTP sent')));
  }

  @override
  Widget build(BuildContext context) {
    final contactInfo = widget.userEmail.isNotEmpty
        ? widget.userEmail
        : widget.userPhone;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 255),
      appBar: AppBar(
        title: const Text('OTP Verification'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true, // allow back manually if needed
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Icon(Icons.lock_open, size: 80, color: Colors.deepPurple),
              const SizedBox(height: 20),
              const Text(
                "OTP Verification",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Enter the OTP sent to $contactInfo',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // OTP Input
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 8,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: '0000',hintStyle: TextStyle(fontWeight: FontWeight.w200),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Verify Button
              ElevatedButton(
                onPressed: _isOtpEntered ? _verifyOtp : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: _isOtpEntered
                      ? Colors.deepPurpleAccent
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Verify & Continue", style: TextStyle(color: Colors.white),),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: _resendOtp,
                child: const Text(
                  "Resend OTP",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("← Back to Login"),
              ),
            ],
          ),
        ),
     ),
);
}
}
