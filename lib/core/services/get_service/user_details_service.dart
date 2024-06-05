import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/user_details/user_details.dart';

class FetchUserService {
  static Future<UserDetails> fetchUserData() async {
    final url = Uri.parse('${ApiConstants.baseUrl}user/info');
        // Print the stored access token
    String accessToken = await  GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

    // Add your Bearer token here
    final token = accessToken;
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Parse response body to UserDetails object
        final jsonData = json.decode(response.body);
        UserDetails userDetails = UserDetails.fromJson(jsonData);
         await SetSharedPreferences.storeCustomerId(userDetails.data!.customerId as int);
         print("fetching successfull ${response.body}");
        return userDetails; // Return UserDetails object
      } else {
          print("fetching fa ${response.body}");
        final jsonData = json.decode(response.body);
        return jsonData; // Return UserDetails object
      }
    } catch (e) {
      rethrow;
    }
  }

}
