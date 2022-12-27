import 'package:flutter/material.dart';
import 'package:untitled2/home_page.dart';
import 'package:untitled2/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Flutter',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
    );
  }
}

