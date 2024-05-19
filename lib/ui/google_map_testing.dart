// import 'package:flutter/material.dart';
// import 'package:maps_launcher/maps_launcher.dart';
// import 'package:yes_loyality/core/model/store_details/store_details.dart';
// import 'package:yes_loyality/core/services/get_service/store_service.dart';

// // class GoogleMap extends StatelessWidget {
// //   const GoogleMap({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: <Widget>[
// //             ElevatedButton(
// //               onPressed: () =>
// //                   MapsLauncher.launchQuery('Oberon Mall'),
// //               child: Text('LAUNCH QUERY'),
// //             ),
// //             SizedBox(height: 32),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Store Details'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 await StoreService.fetchStoreDetails();
//               },
//               child: const Text('Fetch Store Details'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
