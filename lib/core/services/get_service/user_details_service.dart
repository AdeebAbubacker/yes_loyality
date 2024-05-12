import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/db/shared/shared_prefernce.dart';
import 'package:yes_loyality/core/model/user_details/user_details.dart';

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
         print("fetching successfull ${userDetails.data?.image}");
        return userDetails; // Return UserDetails object
      } else {
        final jsonData = json.decode(response.body);
        return jsonData; // Return UserDetails object
      }
    } catch (e) {
      rethrow;
    }
  }

}
