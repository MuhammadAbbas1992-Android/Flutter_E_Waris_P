class AssetModel {
  final String? id;
  final String platformName;
  final String category;
  final String email;
  final String notes;
  final String addedOn;

  AssetModel({
    this.id,
    required this.platformName,
    required this.category,
    required this.email,
    required this.notes,
    required this.addedOn,
  });

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'platformName': platformName,
      'category': category,
      'email': email,
      'notes': notes,
      'addedOn': addedOn,
    };
  }

  // Convert JSON to Model
  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['id'] ?? '',
      platformName: json['platformName'] ?? '',
      category: json['category'] ?? '',
      email: json['email'] ?? '',
      notes: json['notes'] ?? '',
      addedOn: json['addedOn'] ?? '',
    );
  }
}