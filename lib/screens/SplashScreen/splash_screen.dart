// import 'package:alp_animated_splashscreen/alp_animated_splashscreen.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const AnimatedSplashScreen(
//       companyname: 'Alp Turnkey Solutions',
//       brandnamecolor: Colors.orange,
//       backgroundcolor: Colors.black,
//       foregroundcolor: Colors.orange,
//       logo: 'assets/images/logo.png',
//       brandname: 'Alp Turnkey Solutions',
//     );
//   }}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rowad_classes/screens/SplashScreen/onBoarding.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Animation duration
      vsync: this,
    );

    // Define a scale animation
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();

    // Set a timer for 2 seconds to navigate to the next page
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingPage()),
      );
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when not in use
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/logo.png', // Replace with your logo path
                width: 150, // Adjust size as needed
                height: 150,
              ),
            ),
          ),
      ),
      );
  }
}