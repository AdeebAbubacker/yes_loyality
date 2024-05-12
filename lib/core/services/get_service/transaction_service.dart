import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/db/shared/shared_prefernce.dart';
import 'package:yes_loyality/core/model/transaction_details/transaction_details.dart';
import 'package:yes_loyality/core/model/user_details/user_details.dart';

class FetchTransactionService {
  static Future<TransactionDetails> fetchTransactinData() async {
    String? storedBranchId = await GetSharedPreferences.getbranchId();
    // Check if the stored branch ID is not empty
    if (storedBranchId != null && storedBranchId.isNotEmpty) {
      // Use the stored branch ID instead of the default value
      String branchid = storedBranchId;
    }

    // Construct the URL based on the branch ID
    final url = storedBranchId != null && storedBranchId.isNotEmpty
        ? Uri.parse(
            '${ApiConstants.baseUrl}user/transaction?branch_id=$storedBranchId')
        : Uri.parse('${ApiConstants.baseUrl}user/transaction');
    // Print the stored access token
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

    // Add your Bearer token here
    final token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMmFiMmFkNjZmZGJlMTJlMTg4N2I5ZWMyOWQxZmFiNzZmYTkyODljNGQxMTM4MjYxY2E5YWYwM2EyZTkzNzhiMTgyMzBhMDJiNTdlNzdmMjMiLCJpYXQiOjE3MTUyMzQzNjUuMjA2NzI2LCJuYmYiOjE3MTUyMzQzNjUuMjA2NzI4LCJleHAiOjE3NDY3NzAzNjUuMjAyNDQ0LCJzdWIiOiI0MiIsInNjb3BlcyI6W119.k9BtPpAtczE5xrHGQxAD22dLl5LKcZJz4mw6bRM7NyqDahOB-a1BPvdl_tMEiYxlrdl-1dfMoEiKFnfXIVXICs9byfDTl2miOTJcLE_npy_8pFo6lUvwQbCeQnfh6jdWAV6sEJtZSh2lN8AaC0QYgWO3eBIBmushRXC426rdMI0-N9gNIbtPHx-z58cMeRXLVICIDqDiIRwGeKxUS9KbrF8uxNCvyaitO_8bn-D_rGTMG11WLf-iU9HcUh0PEqaGJLbrIue2G4o519-MsCjo0a2-CW9mHo_gVl9rJbJDZri0SjGi0zhXHKcCLxPPIcqszpaF-X7Z3SGI-CljxFALyPs9kDeOdxLKTBbQ7RcwQj9vxAMDdkF19rGlcDEnvuR-EqOlqOS8juBeLfhAUUo7U8uc_bRXMIGYxl59QwbnzwMgHf-eXfIFsoecBz-kO1ql6KqvjnIbXBWSpPXT0H_TqCEm282v2K-CJ3KJlKoAwzyKYkgO4KkDSI3Cg3fxWrOqB4kJOXKWiSXBkM0dlqrqvdJXZX84hpKnOleuz-VeOkegLEc9-zCNx-Vw4v-CCcz8WsICPBrxhSlifIurGDsX1BiEfgZIyP9_qUQzk0Tx0Tc744057TlVJLCanfPQT9jt2x6nEDpm7VG9GzLAaV73GkdiLjkOmZ7pAsrRlvkhIu8";
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
        TransactionDetails userDetails = TransactionDetails.fromJson(jsonData);

        print("fetching successfull ${userDetails.data?[0].storeId}");
        return userDetails; // Return UserDetails object
      } else {
        print("fetching failed");
        final jsonData = json.decode(response.body);
        return jsonData; // Return UserDetails object
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
