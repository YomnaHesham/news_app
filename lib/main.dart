import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/screens/category_item_detailes/news_detailes.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      saveLocale: true,
      path: 'assets/translations',
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routName: (context) => const SplashScreen(),
        HomeScreen.routName: (context) => HomeScreen(),
      },
      initialRoute: SplashScreen.routName,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
