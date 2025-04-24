import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gitmago/features/auth/data/models/login_request.dart';

class AuthRepository {
  final String baseUrl = dotenv.env['API_BASE_URL']!;

  Future<bool> login(LoginRequest request) async {
    final url = Uri.parse('https://$baseUrl/api/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': request.username,
        'password': request.password,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }
}
