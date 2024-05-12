import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:yes_loyality/core/db/shared/shared_prefernce.dart';

class QrPopup extends StatelessWidget {
  const QrPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: FutureBuilder(
        future: _loadCustomerId(), // Retrieve customer ID asynchronously
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while retrieving customer ID
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Handle error
            return Text('Error: ${snapshot.error}');
          } else {
            // Customer ID loaded successfully, display QR code
            return Container(
              width: 310,
              height: 310,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close the dialog
                      },
                      child: SvgPicture.asset(
                        "assets/Close.svg",
                        width: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: QrImageView(
                      data: snapshot.data
                          .toString(), // Display QR code with customer ID
                      version: QrVersions.auto,
                      size: 170,
                    ),
                  ),
                  const SizedBox(height: 9),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<int?> _loadCustomerId() async {
    String accessToken = await GetSharedPreferences.getAccessToken()  ??
        'Access Token empty';
    return null;
  }
}
