// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../models/user_model.dart';
// import '../models/auth_token_model.dart';

// abstract class AuthLocalDataSource {
//   Future<void> saveAuthToken(AuthTokenModel token);
//   Future<AuthTokenModel?> getAuthToken();
//   Future<void> removeAuthToken();

//   Future<void> saveUser(UserModel user);
//   Future<UserModel?> getUser();
//   Future<void> removeUser();

//   Future<bool> isLoggedIn();
// }

// class AuthLocalDataSourceImpl implements AuthLocalDataSource {
//   final SharedPreferences sharedPreferences;

//   static const String authTokenKey = 'auth_token';
//   static const String userKey = 'user';

//   AuthLocalDataSourceImpl({required this.sharedPreferences});

//   @override
//   Future<void> saveAuthToken(AuthTokenModel token) async {
//     final tokenJson = jsonEncode(token.toJson());
//     await sharedPreferences.setString(authTokenKey, tokenJson);
//   }

//   @override
//   Future<AuthTokenModel?> getAuthToken() async {
//     final tokenJson = sharedPreferences.getString(authTokenKey);
//     if (tokenJson != null) {
//       final tokenMap = jsonDecode(tokenJson) as Map<String, dynamic>;
//       return AuthTokenModel.fromJson(tokenMap);
//     }
//     return null;
//   }

//   @override
//   Future<void> removeAuthToken() async {
//     await sharedPreferences.remove(authTokenKey);
//   }

//   @override
//   Future<void> saveUser(UserModel user) async {
//     final userJson = jsonEncode(user.toJson());
//     await sharedPreferences.setString(userKey, userJson);
//   }

//   @override
//   Future<UserModel?> getUser() async {
//     final userJson = sharedPreferences.getString(userKey);
//     if (userJson != null) {
//       final userMap = jsonDecode(userJson) as Map<String, dynamic>;
//       return UserModel.fromJson(userMap);
//     }
//     return null;
//   }

//   @override
//   Future<void> removeUser() async {
//     await sharedPreferences.remove(userKey);
//   }

//   @override
//   Future<bool> isLoggedIn() async {
//     final token = await getAuthToken();
//     return token != null && !token.isExpired;
//   }
// }
