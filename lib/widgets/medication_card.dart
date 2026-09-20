import 'package:flutter/material.dart';

import '../models/medication.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({
    super.key,
    required this.medication,
  });

  final Medication medication;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.teal.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.medication, color: Colors.teal),
        ),
        title: Text(medication.name),
        subtitle: Text('${medication.dosage} • ${medication.time}'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
