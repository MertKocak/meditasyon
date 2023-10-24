import 'package:flutter/material.dart';
import 'package:meditasyon/view/HomePage.dart';
import 'package:meditasyon/view/AudioPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
