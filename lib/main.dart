import 'package:berrystamp_test/constants/colors.dart';
import 'package:berrystamp_test/screens/login.dart';
import 'package:flutter/material.dart';
 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BerryStamp Test',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: lightDark,
              displayColor: Colors.pinkAccent,
            ),
      ),
      home: const LoginPage(),
    );
  }
}
