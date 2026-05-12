class NomineeModel {
   String? id;
  final String name;
  final String email;
  final String phone;
  final String relation;

  NomineeModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.relation,
  });

  // Firebase → Model
  factory NomineeModel.fromMap(
      Map<dynamic, dynamic> map,
      String? id,
      ) {
    return NomineeModel(
      id: id,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      relation: map['relation'] ?? '',
    );
  }

  // Model → Firebase
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'relation': relation,
    };
  }

  // CopyWith
  NomineeModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? relation,
  }) {
    return NomineeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      relation: relation ?? this.relation,
    );
  }
}