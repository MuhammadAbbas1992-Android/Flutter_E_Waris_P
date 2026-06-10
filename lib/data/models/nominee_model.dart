class NomineeModel {
  final String? id; // nullable
  final String name;
  final String email;
  final String phone;
  final String relationship;

  NomineeModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.relationship,
  });

  /// JSON → Model
  factory NomineeModel.fromJson(Map<String, dynamic> json) {
    return NomineeModel(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      relationship: json['relationship'] ?? '',
    );
  }

  /// Model → JSON
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'relationship': relationship,
    };
  }

  /// copyWith
  NomineeModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? relationship,
  }) {
    return NomineeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      relationship: relationship ?? this.relationship,
    );
  }

  @override
  String toString() {
    return '''
NomineeModel(
  id: $id,
  name: $name,
  email: $email,
  phone: $phone,
  relationship: $relationship
)
''';
  }
}