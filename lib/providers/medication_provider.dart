import 'package:flutter/foundation.dart';

import '../models/medication.dart';

class MedicationProvider extends ChangeNotifier {
  final List<Medication> _medications = [
    const Medication(
      id: '1',
      name: 'Vitamin D',
      dosage: '1000 IU',
      time: '08:00 AM',
      notes: 'Take after breakfast.',
    ),
    const Medication(
      id: '2',
      name: 'Omega-3',
      dosage: '2 capsules',
      time: '12:30 PM',
      notes: 'With lunch and water.',
    ),
    const Medication(
      id: '3',
      name: 'Calcium',
      dosage: '500 mg',
      time: '07:00 PM',
      notes: 'Avoid taking with iron supplements.',
    ),
  ];

  List<Medication> get medications => List.unmodifiable(_medications);
}
