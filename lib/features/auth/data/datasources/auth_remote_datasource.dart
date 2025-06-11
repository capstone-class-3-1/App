// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/user_model.dart';
// import '../models/auth_token_model.dart';

// abstract class AuthRemoteDataSource {
//   Future<AuthTokenModel> login({
//     required String email,
//     required String password,
//   });

//   Future<AuthTokenModel> register({
//     required String email,
//     required String password,
//     required String name,
//   });

//   Future<String> loginWithGitHub();

//   Future<UserModel> getCurrentUser(String token);

//   Future<AuthTokenModel> refreshToken(String refreshToken);
// }

// class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
//   final http.Client client;
//   final String baseUrl;

//   AuthRemoteDataSourceImpl({
//     required this.client,
//     required this.baseUrl,
//   });

//   @override
//   Future<AuthTokenModel> login({
//     required String email,
//     required String password,
//   }) async {
//     final response = await client.post(
//       Uri.parse('$baseUrl/auth/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': email,
//         'password': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       return AuthTokenModel.fromJson(jsonData['data']);
//     } else {
//       final error = jsonDecode(response.body);
//       throw Exception(error['message'] ?? 'Login failed');
//     }
//   }

//   @override
//   Future<AuthTokenModel> register({
//     required String email,
//     required String password,
//     required String name,
//   }) async {
//     final response = await client.post(
//       Uri.parse('$baseUrl/auth/register'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': email,
//         'password': password,
//         'name': name,
//       }),
//     );

//     if (response.statusCode == 201) {
//       final jsonData = jsonDecode(response.body);
//       return AuthTokenModel.fromJson(jsonData['data']);
//     } else {
//       final error = jsonDecode(response.body);
//       throw Exception(error['message'] ?? 'Registration failed');
//     }
//   }

//   @override
//   Future<String> loginWithGitHub() async {
//     return '$baseUrl/auth/github';
//   }

//   @override
//   Future<UserModel> getCurrentUser(String token) async {
//     final response = await client.get(
//       Uri.parse('$baseUrl/auth/me'),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//     );

//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       return UserModel.fromJson(jsonData['data']);
//     } else {
//       final error = jsonDecode(response.body);
//       throw Exception(error['message'] ?? 'Failed to get user');
//     }
//   }

//   @override
//   Future<AuthTokenModel> refreshToken(String refreshToken) async {
//     final response = await client.post(
//       Uri.parse('$baseUrl/auth/refresh'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'refresh_token': refreshToken,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       return AuthTokenModel.fromJson(jsonData['data']);
//     } else {
//       final error = jsonDecode(response.body);
//       throw Exception(error['message'] ?? 'Token refresh failed');
//     }
//   }
// }
