import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yes_loyality/core/model/login/login.dart';
import 'package:yes_loyality/core/model/register/register.dart';

class ApiService {
  static Future<Login> login(
      {required String email, required String password}) async {
    final url = Uri.parse('https://yl.tekpeak.in/api/user/login');

    // Define form data
    Map<String, String> formData = {
      'email': email,
      'password': password,
    };

    // Encode the form data
    var request = http.MultipartRequest('POST', url);
    formData.forEach((key, value) {
      request.fields[key] = value;
    });

    // Send the request
    try {
      var response = await request.send();

      // Check the response status code
      if (response.statusCode == 200) {
        // Decode the response body
        var responseBody = await response.stream.bytesToString();
        var jsonMap = json.decode(responseBody);

        // Construct Login object from parsed data
        var login = Login.fromJson(jsonMap);
        print('Request successful ${login.data.email}');
        return login;
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to login: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error sending request: $e');
      throw e;
    }
  }

  static Future<Register> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String password_confirm,
  }) async {
    final url = Uri.parse('https://yl.tekpeak.in/api/user/register');

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

      // Check the response status code
      if (response.statusCode == 200) {
        var dfd = await response.stream.bytesToString();
        // ignore: avoid_print
        print('Response Body: $dfd');
        // Decode the response body
        var responseBody = await response.stream.bytesToString();
        var jsonMap = json.decode(responseBody);

        // Construct Login object from parsed data
        var register = Register.fromJson(jsonMap);
        // ignore: avoid_print
        print('Request successful ${register.data?.email.toString()}');
        return register;
      } else {
        // ignore: avoid_print
        print('Request failed with status: ${response.stream.bytesToString()}');
        throw Exception('Failed to login: ${response.reasonPhrase}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error sending request: $e');
      throw e;
    }
  }
}
