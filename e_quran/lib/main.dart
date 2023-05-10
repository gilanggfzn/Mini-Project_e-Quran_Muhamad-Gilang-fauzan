import 'package:e_quran/screen/list_surah_screen.dart';
import 'package:e_quran/screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color.fromARGB(255, 7, 255, 69),
      title: 'E-Quran',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
