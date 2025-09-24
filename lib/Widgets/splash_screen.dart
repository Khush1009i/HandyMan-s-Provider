
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handyman_provider/Widgets/login_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

   
    _controller.forward().then((_) {
      _controller.reverse().then((_) {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
               Color(0xFF7B3FF2),
               Color.fromARGB(255, 93, 47, 187),
               Color.fromARGB(255, 84, 3, 244),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 10),
              Text(
                "ServEase",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600, ).fontFamily,
                  fontWeight: FontWeight.w900,
                ),
              ),
              
              Text(
                "Handy Man",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600, ).fontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
