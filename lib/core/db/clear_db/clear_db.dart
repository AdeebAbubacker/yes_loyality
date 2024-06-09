// // Function to clear shared preferences
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future<void> clearSharedPreferences() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.clear(); // Clears all stored preferences
// }

// // Function to clear Hive database
// Future<void> clearHiveDatabase() async {
//   await Hive.deleteFromDisk(); // Deletes the entire Hive database
// }

// // Function to perform both actions when deleting an account
// Future<void> deleteAccount() async {
//   // Clear shared preferences
//   await clearSharedPreferences();

//   // Clear Hive database
//   await clearHiveDatabase();

//   // Add any additional cleanup steps here if needed
// }