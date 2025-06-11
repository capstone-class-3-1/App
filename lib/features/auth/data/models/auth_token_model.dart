// import '../../domain/entities/auth_token.dart';

// class AuthTokenModel extends AuthToken {
//   const AuthTokenModel({
//     required super.accessToken,
//     required super.refreshToken,
//     required super.expiresAt,
//   });

//   factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
//     return AuthTokenModel(
//       accessToken: json['access_token'] as String,
//       refreshToken: json['refresh_token'] as String,
//       expiresAt: DateTime.fromMillisecondsSinceEpoch(
//         json['expires_at'] as int,
//       ),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'access_token': accessToken,
//       'refresh_token': refreshToken,
//       'expires_at': expiresAt.millisecondsSinceEpoch,
//     };
//   }

//   factory AuthTokenModel.fromEntity(AuthToken token) {
//     return AuthTokenModel(
//       accessToken: token.accessToken,
//       refreshToken: token.refreshToken,
//       expiresAt: token.expiresAt,
//     );
//   }

//   AuthToken toEntity() {
//     return AuthToken(
//       accessToken: accessToken,
//       refreshToken: refreshToken,
//       expiresAt: expiresAt,
//     );
//   }
// }
