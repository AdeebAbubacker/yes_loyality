import 'dart:convert';
import 'dart:io';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/model/register/register.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

class ProfileEditService {
  static Future<Register> editProfile({
    required String name,
    required String email,
    required String phone,
    File? image,
  }) async {
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

    final url = Uri.parse('${ApiConstants.baseUrl}user/modify');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Add form fields
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['phone'] = phone;

    // Add image file as a multipart file if provided
    if (image != null) {
      var imagePart = http.MultipartFile(
        'image', // Field name
        image.readAsBytes().asStream(), // Byte stream
        image.lengthSync(), // Length of the file
        filename: image.path.split('/').last, // File name
      );
      request.files.add(imagePart);
    }

    // Set Authorization header with Bearer token
    request.headers['Authorization'] = 'Bearer ${accessToken}';

    // Send the request
    try {
      var response = await request.send();

      // Read the response body
      var responseBody = await response.stream.bytesToString();
      print('Response Body: $responseBody');

      // Check the response status code
      if (response.statusCode == 200) {
        print('Success in fetching $response');
        // Decode the response body
        var jsonMap = json.decode(responseBody);
        // Store user details in Hive
        await UserDetailsBox.put(
          await GetSharedPreferences.getCustomerId(),
          UserDetailsDB(
            email: jsonMap['email'],
            name: jsonMap['name'],
            phone: jsonMap['phone']

            // Add other fields if needed
          ),
        );

        Register register = Register.fromJson(jsonMap);

        return register; // Return UserDetails object
      } else {
        print("FAILURE $response");
        // Handle non-200 status codes appropriately
        print('Request failed with status: $responseBody');
        throw Exception('Request failed: ${response.statusCode}');
      }
    } catch (e) {
      // Print error and consider retry logic or informative error messages
      print('Error sending request: $e');
      rethrow;
    }
  }
}
