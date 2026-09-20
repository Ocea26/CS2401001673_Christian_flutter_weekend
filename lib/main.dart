import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/add_medication_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MedicationReminderApp()));
}

class MedicationReminderApp extends StatelessWidget {
  const MedicationReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Reminder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const MedicationHomePage(),
    );
  }
}

class MedicationHomePage extends StatefulWidget {
  const MedicationHomePage({super.key});

  @override
  State<MedicationHomePage> createState() => _MedicationHomePageState();
}

class _MedicationHomePageState extends State<MedicationHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddMedicationScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
