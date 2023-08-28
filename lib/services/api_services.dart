import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://reqres.in/api';

class ApiServices {
  static Future<bool> loginUser(Map body) async {
    final uri = Uri.parse('$baseUrl/login');
    final response = await http.post(
      uri,
      body: body,
    );
    return response.statusCode == 200;
  }

  static Future getData() async {
    final uri = Uri.parse('$baseUrl/users/2');
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['data'] as List;
      return result;
    } else {
      print(response.statusCode);
    }
  }
}
