import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yes_loyality/core/constants/const.dart';

class RegsiterService {
  static Future register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String password_confirm,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}user/register');

    // Define form data
    Map<String, String> formData = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "password_confirm": password_confirm,
    };

    // Encode the form data
    var request = http.MultipartRequest('POST', url);
    formData.forEach((key, value) {
      request.fields[key] = value;
    });

    // Send the request
    try {
      var response = await request.send();

      // Read the response body
      var responseBody = await response.stream.bytesToString();
      
      // Check the response status code
      if (response.statusCode == 200) {
        // Print response body for debugging
        print('Response Body: $responseBody');

        // Decode the response body
        var jsonMap = json.decode(responseBody);

        return jsonMap;
      } else if (response.statusCode == 500){
        // Print response body if request failed
        print('Request failed with status: $responseBody');

       return responseBody;
      }
    } catch (e) {
      // Print error
      print('Error sending request: $e');
      rethrow;
    }
  }
}
