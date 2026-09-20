class Medication {
  final String id;
  final String name;
  final String dosage;
  final String time;
  final String notes;
  final bool taken;

  const Medication({
    required this.id,
    required this.name,
    required this.dosage,
    required this.time,
    required this.notes,
    this.taken = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dosage': dosage,
      'time': time,
      'notes': notes,
      'taken': taken,
    };
  }

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'] as String,
      name: json['name'] as String,
      dosage: json['dosage'] as String,
      time: json['time'] as String,
      notes: json['notes'] as String? ?? '',
      taken: json['taken'] as bool? ?? false,
    );
  }

  Medication copyWith({
    String? id,
    String? name,
    String? dosage,
    String? time,
    String? notes,
    bool? taken,
  }) {
    return Medication(
      id: id ?? this.id,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      time: time ?? this.time,
      notes: notes ?? this.notes,
      taken: taken ?? this.taken,
    );
  }
}
