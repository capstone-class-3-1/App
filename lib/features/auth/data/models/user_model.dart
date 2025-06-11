// import '../../domain/entities/user.dart';

// class UserModel extends User {
//   const UserModel({
//     required super.id,
//     required super.email,
//     required super.name,
//     super.profileImageUrl,
//     required super.role,
//     required super.createdAt,
//     super.lastLoginAt,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'] as String,
//       email: json['email'] as String,
//       name: json['name'] as String,
//       profileImageUrl: json['profile_image_url'] as String?,
//       role: json['role'] as String? ?? 'user',
//       createdAt: DateTime.parse(json['created_at'] as String),
//       lastLoginAt: json['last_login_at'] != null
//           ? DateTime.parse(json['last_login_at'] as String)
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'email': email,
//       'name': name,
//       'profile_image_url': profileImageUrl,
//       'role': role,
//       'created_at': createdAt.toIso8601String(),
//       'last_login_at': lastLoginAt?.toIso8601String(),
//     };
//   }

//   factory UserModel.fromEntity(User user) {
//     return UserModel(
//       id: user.id,
//       email: user.email,
//       name: user.name,
//       profileImageUrl: user.profileImageUrl,
//       role: user.role,
//       createdAt: user.createdAt,
//       lastLoginAt: user.lastLoginAt,
//     );
//   }

//   User toEntity() {
//     return User(
//       id: id,
//       email: email,
//       name: name,
//       profileImageUrl: profileImageUrl,
//       role: role,
//       createdAt: createdAt,
//       lastLoginAt: lastLoginAt,
//     );
//   }
// }
