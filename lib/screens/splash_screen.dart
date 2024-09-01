import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/screens/home_screen.dart';

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
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, HomeScreen.routName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.fill,
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
