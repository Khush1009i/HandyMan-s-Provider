import 'package:flutter/material.dart';
import 'dart:math';
import 'package:handyman_provider/Widgets/otp_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<LoginPage> {
  // Controllers for Sign In
  final TextEditingController _signInEmailController = TextEditingController();
  final TextEditingController _signInPhoneController = TextEditingController();

  // Country code state
  String _selectedCountryCode = '+91';
  final List<String> _countryCodes = ['+91', '+1', '+44', '+61', '+971', '+92'];

  void _handleSignIn() {
    if (_signInEmailController.text.isEmpty &&
        _signInPhoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter either email or phone number'),
        ),
      );
      return;
    }
    String generatedOtp = (1000 + Random().nextInt(9000)).toString();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpScreen(
          generatedOtp: generatedOtp,
          userEmail: _signInEmailController.text,
          userPhone: '$_selectedCountryCode${_signInPhoneController.text}', // Pass code+number
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Welcome Back!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Sign in to continue your learning journey.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        _buildTextField(_signInEmailController, 'Email', Icons.email),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'OR',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
          ],
        ),
        const SizedBox(height: 15),

        // Mobile number with changeable country code
        TextField(
          controller: _signInPhoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone, color: Colors.deepPurpleAccent),
            prefix: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedCountryCode,
                items: _countryCodes
                    .map((code) => DropdownMenuItem(
                        value: code,
                        child: Text(
                          code,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        )))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    if (val != null) _selectedCountryCode = val;
                  });
                },
              ),
            ),
            hintText: 'Mobile number',
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: _handleSignIn,
          child: const Text('Send OTP'),
        ),
        const SizedBox(height: 25),
        const Text('Or sign in with'),
        const SizedBox(height: 15),
        _buildSocialButton('Continue with Google', Icons.g_mobiledata),
        const SizedBox(height: 10),
        _buildSocialButton('Continue with Facebook', Icons.facebook),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    IconData icon, {
    bool obscure = false,
    TextInputType? keyboardType,
    Function(String)? onChanged,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.deepPurpleAccent),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: const BorderSide(color: Colors.deepPurpleAccent),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {},
      icon: Icon(icon, color: Colors.deepPurple),
      label: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Login In',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontFamily: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ).fontFamily,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.deepPurpleAccent),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: _buildSignInForm(),
      ),
    );
  }
}
