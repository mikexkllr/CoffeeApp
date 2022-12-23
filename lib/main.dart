import 'package:flutter/material.dart';
import 'package:coffee_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.brown,
      ),
    );
  }
}
