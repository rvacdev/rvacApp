import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static Future<Map<String, dynamic>> signUp(String userEmail, String userName, String userPassword) async {
    final response = await http.post(
      Uri.parse('https://your-api-endpoint.com/signup.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_email': userEmail,
        'user_name': userName,
        'user_password': userPassword,
      }),
    );

    return jsonDecode(response.body);
  }

  }// Add other API functions as needed (e.g., login)