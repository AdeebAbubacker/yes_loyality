import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? _prefs;

  // Initialize shared preferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

//Set Methods
  static Future<void> storeccessoken({required String accessToken}) async {
    await _prefs?.setString("accessToken", accessToken);
  }

  static Future<void> storeQrCode({required String qrcode}) async {
    await _prefs?.setString("qrcode", qrcode);
  }

//Get Methods

  static String getaccesstoken({required String accessToken}) {
    return _prefs?.getString(accessToken) ?? '';
  }

  static String getQrCode() {
    return _prefs?.getString("qrcode") ?? 'dff';
  }
}
