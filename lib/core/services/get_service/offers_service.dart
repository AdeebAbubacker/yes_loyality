// File: offer_list_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/db/shared/shared_prefernce.dart';
import 'package:yes_loyality/core/model/offers_info/offers_info.dart';
import 'package:yes_loyality/core/model/offers_list/offers_list.dart';
import 'package:yes_loyality/core/model/user_details/user_details.dart';

class OffersService {
  static Future<OffersList> fetchOfferListData() async {
    final url = Uri.parse('${ApiConstants.baseUrl}branch/1000/offers/list');
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
        OffersList offersList = OffersList.fromJson(jsonData);
        print(offersList.data?[0].branchName);
        return offersList; // Return UserDetails object
      } else {
        final jsonData = json.decode(response.body);
        return jsonData; // Return UserDetails object
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<OffersInfo> fetchOfferInfo() async {
    final url = Uri.parse('${ApiConstants.baseUrl}branch/1000/offers/12');
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
        OffersInfo offersInfo = OffersInfo.fromJson(jsonData);
        print(offersInfo.data?.comments);
        return offersInfo; // Return UserDetails object
      } else {
        final jsonData = json.decode(response.body);
        return jsonData; // Return UserDetails object
      }
    } catch (e) {
      rethrow;
    }
  }
}
