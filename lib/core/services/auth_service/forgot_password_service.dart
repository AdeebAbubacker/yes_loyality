import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/login_validation/login_validation.dart';
import 'package:Yes_Loyalty/core/model/reset_password_model/reset_password_model.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';

class ForgotPassWordService {
  static Future<Either<LoginValidation, ResetPasswordModel>> forgotPassword(
      {required String email}) async {
    // Print the stored access token
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';
    final token = accessToken;

    final url = Uri.parse('${ApiConstants.baseUrl}user/password/forgot');

    // Define form data
    Map<String, String> formData = {
      'email': email,
    }; // Encode the form data
    final response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: formData);
    try {
      // Check the response status code
      if (response.statusCode == 200) {
        // Decode the response body
        print(response.body.toString());
        var jsonMap = json.decode(response.body);
        ResetPasswordModel resetPasswordModel =
            ResetPasswordModel.fromJson(jsonMap);
        return right(resetPasswordModel);
      } else if (response.statusCode == 500) {
        var jsonMap = json.decode(response.body);
        var validate = LoginValidation.fromJson(jsonMap);
        print(
            'dddddddddddddddddddddddddddddddddddddd ${validate.data?.email?.toList().toString()}');
        return left(validate);
      }
    } catch (e) {
      rethrow;
    }
    var jsonMap = json.decode(response.body);
    var validate = LoginValidation.fromJson(jsonMap);
    print(
        'dddddddddddddddddddddddddddddddddddddd ${validate.data?.email?.toList().toString()}');
    return left(validate);
  }
}


