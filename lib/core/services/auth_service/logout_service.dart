import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/db/shared/shared_prefernce.dart';

class LogoutService {
  static Future logout() async {
    final url = Uri.parse('${ApiConstants.baseUrl}user/logout');
  
    // Print the stored access token
    String accessToken = await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';
   

    // Add your Bearer token here
    final token = accessToken;
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Successful logout
        print('Logout successful');
      } else {
        // Handle other status codes
        print('Logout failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error
      print('Error during logout: $e');
    }
  }
}
