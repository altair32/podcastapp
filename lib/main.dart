import 'package:cybdom_podcast/screens/home.dart';
import 'package:cybdom_podcast/screens/intro.dart';
import 'package:cybdom_podcast/screens/player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const IntroScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}