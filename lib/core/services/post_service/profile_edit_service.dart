// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:Yes_Loyalty/core/constants/const.dart';
// import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

// class ProfileEditService {
//   static Future<Map<String, dynamic>?> editProfile({
//     required String name,
//     required String email,
//     required String phone,
//     required File image,
//   }) async {
//     String accessToken =
//         await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

//     final url = Uri.parse('${ApiConstants.baseUrl}user/modify');

//     // Create a multipart request
//     var request = http.MultipartRequest('POST', url);

//     // Add form fields
//     request.fields['name'] = name;
//     request.fields['email'] = email;
//     request.fields['phone'] = phone;

//     // Add image file as a multipart file
//     var imagePart = http.MultipartFile(
//       'image', // Field name
//       image.readAsBytes().asStream(), // Byte stream
//       image.lengthSync(), // Length of the file
//       filename: image.path.split('/').last, // File name
//     );
//     request.files.add(imagePart);

//     // Set Authorization header with Bearer token
//     request.headers['Authorization'] =
//         'Bearer ${"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTE4ZDYxMmM4MTQ5MDkzZjM0OThmM2YxYzdiOTYwZWNlZDRkYjhlYTU1ZmU2ZDhiZjVjY2EwZGM4NzQ5NjRlOGRiM2Q2Mjc2OTU0NmM5YWYiLCJpYXQiOjE3MTUxNTgwNDYuNTQ2MDY5LCJuYmYiOjE3MTUxNTgwNDYuNTQ2MDcxLCJleHAiOjE3NDY2OTQwNDYuNTQyNjUxLCJzdWIiOiIzOSIsInNjb3BlcyI6W119.nIwcgxWka9Gct6hkLp47NktRARi2ZlOQGHBqjSoX782uGqmptQbIoWaVaNaIH7_7Ne2w-aZxkI9H1wcbpdEh9oSB9J0eoA4X-TpWDSkWZU9djKvCX-uthyLcS2B3AMS04QN5Hkh39dk-tVyLddoMmVm6xbYEKX1rTbMSed1J08lnQV5S3AsvX6ToK5emGE8TL-ey1h2rGYwncU__ONFGAzxBIKpQreGsFrA-EkxTKSdmHuVUM5RVbiZgM-wJgZKsi763Egyl5d2pCBL7GSMnoMhfmBLAzCaMhh4cp9tWcRDVnESl53vsc8MsN0kMdg0cqJhrO9WCRRhdwZqhX-aoCeipee3cI7CQ9KM6xMX6aP5OPKpVzYlivB__eCNUmy7QfZYV2x_8w8mosaD0XczlqluJlbhpubbYy40gwZYaL6XE6GxXOBaEXb8Cf16Ql4E18dpZsXAO8cXroo9zcJvxyLrVkvKAcLeCAYzXeyK5rzQvZzNPUMfAoWdnaYkzR6_b9e1RGHEoVTlrw-JTeBwp2YRar6PlUBM-oLQ6IUqcfB0tlkcFTuFOkDrpwlOR6JDFj5kxG7GgiFwcMa_nW_ZVlYwNWow1B_PdNJvuCPmIXOOBbZl0OdW_7NteFgw0BphMSYKTX6HiCyefbvk6cDKmbUtMUPWEmQ1nvascOtx7p9M"}';

//     // Send the request
//     try {
//       var response = await request.send();

//       // Read the response body
//       var responseBody = await response.stream.bytesToString();
//       print('Response Body: $responseBody');

//       // Check the response status code
//       if (response.statusCode == 200) {
//         print('Success in fetching $response');
//         // Decode the response body
//         var jsonMap = json.decode(responseBody);
//         return jsonMap;
//       } else {
//         print("FAILURE $response");
//         // Handle non-200 status codes appropriately
//         print('Request failed with status: $responseBody');
//         throw Exception('Request failed: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Print error and consider retry logic or informative error messages
//       print('Error sending request: $e');
//       rethrow;
//     }
//   }
// }


import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

class ProfileEditService {
  static Future<Map<String, dynamic>?> editProfile({
    required String name,
    required String email,
    required String phone,
    File? image, // Make image parameter nullable
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
    request.headers['Authorization'] =
        'Bearer ${accessToken}';

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
        return jsonMap;
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
