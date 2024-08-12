import 'package:flutter/material.dart';
import 'package:top_ten/home_screen.dart';
import 'package:top_ten/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget choseScreen = const SplashScreen();

    void mytime() async{
      await Future.delayed(const Duration(seconds: 20),() => setState(() {
        choseScreen = const HomeScreen();
      }));
  }
  @override
  Widget build(BuildContext context) {
      // mytime();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
