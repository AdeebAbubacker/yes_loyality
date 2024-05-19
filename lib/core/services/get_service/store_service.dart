// File: offer_list_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/store_details/store_details.dart';

import '../../model/store_list/store_list.dart';

class StoreService {
  static Future<StoreDetails> fetchStoreDetails(
      {required String storeId}) async {
    final url = Uri.parse('${ApiConstants.baseUrl}branch/${storeId}/info');
    // Print the stored access token
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

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
        StoreDetails storeDetails = StoreDetails.fromJson(jsonData);
        print("--------------------------------------------------------------");
        print("Success");
        print(storeDetails);
        print("--------------------------------------------------------------");
        return storeDetails; // Return UserDetails object
      } else {
        print("dfdfgdf");
            print("--------------------------------------------------------------");
        print("error");
        print("--------------------------------------------------------------");
        final jsonData = json.decode(response.body);
        return jsonData; // Return UserDetails object
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<StoreList> fetchStoreList() async {
    final url = Uri.parse('${ApiConstants.baseUrl}branch/list');
    // Print the stored access token
    String accessToken =
        await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';

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
        StoreList storeList = StoreList.fromJson(jsonData);

        return storeList; // Return UserDetails object
      } else {
        final jsonData = json.decode(response.body);
        return jsonData; // Return UserDetails object
      }
    } catch (e) {
      rethrow;
    }
  }
}
