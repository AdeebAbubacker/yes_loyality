// File: offer_list_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/db/shared/shared_prefernce.dart';
import 'package:yes_loyality/core/model/store_details/store_details.dart';

import '../../model/store_list/store_list.dart';

class StoreService {
  static Future<StoreDetails> fetchStoreDetails() async {
    final url = Uri.parse('${ApiConstants.baseUrl}branch/1001/info');
        // Print the stored access token
    String accessToken =  await GetSharedPreferences.getAccessToken() ?? 'Access Token empty';
   

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
        print(storeDetails.data?.active);
        return storeDetails; // Return UserDetails object
      } else {
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
        StoreList storeList = StoreList.fromJson(jsonData);
        print(storeList.data?[0].active);
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


