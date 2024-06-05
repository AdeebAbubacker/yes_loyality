import 'package:Yes_Loyalty/core/model/login_validation/login_validation.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/model/login/login.dart';

// class LoginService {
//   static Future<Login> login({required String email, required String password}) async {
//     final url = Uri.parse('${ApiConstants.baseUrl}user/login');

//     // Define form data
//     Map<String, String> formData = {
//       'email': email,
//       'password': password,
//     };

//     // Encode the form data
//     var response = await http.post(url, body: formData);

//     // Check the response status code
//     if (response.statusCode == 200) {
//       // Decode the response body
//       var jsonMap = json.decode(response.body);

//       // Construct Login object from parsed data
//       var login = Login.fromJson(jsonMap);
//       print('Request successful ${login.data.email}');
//       return login;
//     } else {
//       print('Request failed with status: ${response.body}');
//       throw Exception('Failed to login: ${response.body}');
//     }
//   }
// }

class LoginService {
  static Future<Either<LoginValidation, Login>> login(
      {required String email, required String password}) async {
    final url = Uri.parse('${ApiConstants.baseUrl}user/login');

    // Define form data
    Map<String, String> formData = {
      'email': email,
      'password': password,
    };

    // Encode the form data
    var response = await http.post(url, body: formData);

    // Check the response status code
    if (response.statusCode == 200) {
      // Decode the response body
      var jsonMap = json.decode(response.body);

      // Construct Login object from parsed data
      var login = Login.fromJson(jsonMap);
      print('Request successful ${login.data.email}');
      return right(login);
    } else if (response.statusCode == 500) {
      var jsonMap = json.decode(response.body);
      var validate = LoginValidation.fromJson(jsonMap);
      print(
          'from api services ${validate.data?.email} ${validate.data?.password}');
      return left(validate);
    } else {
      print('Request failed with status: ${response.body}');
      throw Exception('Failed to login: ${response.body}');
    }
  }
}
