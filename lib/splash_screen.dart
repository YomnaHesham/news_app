import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, HomeScreen.routName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
          ),
        ),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/splash_logo.png",
                width: 199,
                height: 208,
              ),
            ),
            Image.asset(
              "assets/images/splash_leading.png",
              width: 213,
              height: 128,
            ),
          ],
        ),
      ),
    );
  }
}
