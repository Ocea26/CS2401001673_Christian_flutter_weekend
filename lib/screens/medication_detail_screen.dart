import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/medication.dart';
import '../providers/medication_provider.dart';

class MedicationDetailScreen extends ConsumerWidget {
  const MedicationDetailScreen({
    super.key,
    required this.medication,
  });

  final Medication medication;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'medication-${medication.id}',
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.medication, size: 42, color: Colors.teal),
                    const SizedBox(height: 12),
                    Text(
                      medication.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _InfoRow(label: 'Dosage', value: medication.dosage),
            _InfoRow(label: 'Time', value: medication.time),
            _InfoRow(label: 'Notes', value: medication.notes.isEmpty ? 'No notes' : medication.notes),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      ref.read(medicationsProvider.notifier).toggleTaken(medication.id);
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      medication.taken ? Icons.undo : Icons.check_circle,
                    ),
                    label: Text(
                      medication.taken ? 'Mark as not taken' : 'Mark as taken',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: () {
                ref.read(medicationsProvider.notifier).removeMedication(medication.id);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete_outline),
              label: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
