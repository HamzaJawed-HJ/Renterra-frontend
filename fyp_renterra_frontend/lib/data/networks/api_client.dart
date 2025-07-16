import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  // static final String ipUrl = '192.168.0.34';
  // 192.168.186.226
  static final String ipUrl = '192.168.0.37';
  static final String baseUrl = "http://$ipUrl:3000/api/v1";

  // Common POST requests
  static Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      print(uri);
      final response = await http
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(data),
          )
          .timeout(Duration(seconds: 20));

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body.toString());
        return jsonDecode(response.body);
      } else {
        final errorData = jsonDecode(response.body);
        return {
          'success': false,
          'message': errorData['message'],
          'data': errorData,
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'An error occurred: $e'};
    }
  }
}
