class User {
  final String id;
  final String email;
  final String name;
  final String? profileImageUrl;
  final String role;
  final DateTime createdAt;
  final DateTime? lastLoginAt;

  const User({
    required this.id,
    required this.email,
    required this.name,
    this.profileImageUrl,
    required this.role,
    required this.createdAt,
    this.lastLoginAt,
  });

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? profileImageUrl,
    String? role,
    DateTime? createdAt,
    DateTime? lastLoginAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.profileImageUrl == profileImageUrl &&
        other.role == role &&
        other.createdAt == createdAt &&
        other.lastLoginAt == lastLoginAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        profileImageUrl.hashCode ^
        role.hashCode ^
        createdAt.hashCode ^
        lastLoginAt.hashCode;
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, profileImageUrl: $profileImageUrl, role: $role, createdAt: $createdAt, lastLoginAt: $lastLoginAt)';
  }
}