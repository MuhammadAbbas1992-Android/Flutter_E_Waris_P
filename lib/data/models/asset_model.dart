class AssetModel {
  final String? id; // nullable
  final String assetName;
  final String category;
  final String websiteName;
  final String email;
  final String password;
  final String importantNote;
  final String? nominee; // ✅ now nullable

  AssetModel({
    this.id,
    required this.assetName,
    required this.category,
    required this.websiteName,
    required this.email,
    required this.password,
    required this.importantNote,
    this.nominee, // ✅ optional now
  });

  /// JSON → Model
  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['id'],
      assetName: json['assetName'] ?? '',
      category: json['category'] ?? '',
      websiteName: json['websiteName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      importantNote: json['importantNote'] ?? '',
      nominee: json['nominee'], // can be null
    );
  }

  /// Model → JSON
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'assetName': assetName,
      'category': category,
      'websiteName': websiteName,
      'email': email,
      'password': password,
      'importantNote': importantNote,
      if (nominee != null) 'nominee': nominee, // optional save
    };
  }

  /// copyWith
  AssetModel copyWith({
    String? id,
    String? assetName,
    String? category,
    String? websiteName,
    String? email,
    String? password,
    String? importantNote,
    String? nominee,
  }) {
    return AssetModel(
      id: id ?? this.id,
      assetName: assetName ?? this.assetName,
      category: category ?? this.category,
      websiteName: websiteName ?? this.websiteName,
      email: email ?? this.email,
      password: password ?? this.password,
      importantNote: importantNote ?? this.importantNote,
      nominee: nominee ?? this.nominee,
    );
  }
}