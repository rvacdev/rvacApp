import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static const String baseUrl = 'https://your-api-endpoint.com'; // Update with the API endpoint

  static Future<Map<String, dynamic>> signUp(String userEmail, String userName, String userPassword) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_email': userEmail,
        'user_name': userName,
        'user_password': userPassword,
      }),
    );

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> login(String userEmail, String userPassword) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_email': userEmail,
        'user_password': userPassword,
      }),
    );

    return jsonDecode(response.body);
  }
}
