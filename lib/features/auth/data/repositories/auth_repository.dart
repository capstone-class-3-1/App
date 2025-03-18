import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_request.dart';

class AuthRepository {
  final String baseUrl = 'http://192.168.56.1:8000/api';

  Future<bool> login(LoginRequest request) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        // TODO: 토큰 저장 등 추가 처리
        return true;
      }
      return false;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }
}
