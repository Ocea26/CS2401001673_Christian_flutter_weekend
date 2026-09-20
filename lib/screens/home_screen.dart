import 'package:flutter/material.dart';

import '../models/medication.dart';
import '../providers/medication_provider.dart';
import '../widgets/medication_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MedicationProvider provider = MedicationProvider();
    final List<Medication> medications = provider.medications;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication Reminder'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's schedule",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: medications.length,
                itemBuilder: (context, index) {
                  return MedicationCard(medication: medications[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Reminder added successfully!')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
