import 'package:flutter/material.dart';

void main() {
  runApp(const MedicationReminderApp());
}

class MedicationReminderApp extends StatelessWidget {
  const MedicationReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IconSplashScreen(),
    );
  }
}

class IconSplashScreen extends StatelessWidget {
  const IconSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage('assets/icon/icon.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
