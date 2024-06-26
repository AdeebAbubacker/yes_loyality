import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

class LogoutService {
  static Future logout() async {
    final url = Uri.parse('${ApiConstants.baseUrl}user/logout');

    // Print the stored access token
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

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
            // Handle other status codes
        print('Logout sssss with status code: ${response.statusCode}');
            // Handle other status codes
        print('Logout failed with status code: ${response.body}');
        UserDetailsBox.clear();
        return 1;
      } else {
        // Handle other status codes
        print('Logout failed with status code: ${response.statusCode}');
            // Handle other status codes
        print('Logout failed with status code: ${response.body}');
        return 0;
      }
    } catch (e) {
      print(e.toString());
      // Handle error
      print('Error during logout: $e');
      return 0;
    }
  }
}
