import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/home_screen.dart';
import 'package:news/splash_screen.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routName: (context) => HomeScreen(),
          SplashScreen.routName: (context) => SplashScreen(),
      
        },
        initialRoute: SplashScreen.routName,
      ),
    );
  }
}
