import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/medication.dart';

class MedicationNotifier extends Notifier<List<Medication>> {
  static const _storageKey = 'medication_reminders';

  @override
  List<Medication> build() => const [];

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final storedValues = prefs.getStringList(_storageKey) ?? const [];

    state = storedValues
        .map((value) => Medication.fromJson(jsonDecode(value) as Map<String, dynamic>))
        .toList();
  }

  Future<void> addMedication(Medication medication) async {
    state = [...state, medication];
    await _persist();
  }

  Future<void> toggleTaken(String id) async {
    state = [
      for (final medication in state)
        if (medication.id == id)
          medication.copyWith(taken: !medication.taken)
        else
          medication,
    ];
    await _persist();
  }

  Future<void> removeMedication(String id) async {
    state = state.where((medication) => medication.id != id).toList();
    await _persist();
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _storageKey,
      state.map((medication) => jsonEncode(medication.toJson())).toList(),
    );
  }
}

final medicationsProvider = NotifierProvider<MedicationNotifier, List<Medication>>(
  MedicationNotifier.new,
);
