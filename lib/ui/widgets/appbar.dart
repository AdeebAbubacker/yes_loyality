import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:Yes_Loyalty/ui/widgets/qr_popup.dart';

class HomeAppBar extends StatefulWidget {
  final bool isthereQr;
  final bool isthereback;
  final VoidCallback? onBackTap; // Define the callback function
  final bool isVisible;
  const HomeAppBar({
    super.key,
    this.isthereQr = true,
    this.isthereback = true,
    this.onBackTap,
    this.isVisible = true,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String qrResult = 'Scanned Data will appear here';
  @override
  Widget build(BuildContext context) {
    final screenwidth = screenWidth(context);
    final paddingw30 = screenwidth * 30 / FigmaConstants.figmaDeviceWidth;
    final paddingw10 = screenwidth * 10 / FigmaConstants.figmaDeviceWidth;
    final paddingw20 = screenwidth * 20 / FigmaConstants.figmaDeviceWidth;

    return Visibility(
      visible: widget.isVisible,
      child: Padding(
        padding: EdgeInsets.only(
          left: paddingw10,
          right: paddingw10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              radius: 233,
              borderRadius: const BorderRadius.all(Radius.circular(23)),
              onTap: widget.onBackTap,
              child: Material(
                color: Colors.transparent, // Ensure the Material is invisible
                child: Container(
                  padding: EdgeInsets.only(
                      left: paddingw20, right: paddingw20, top: 10, bottom: 10),
                  child: Visibility(
                      visible: widget.isthereback,
                      child: SvgPicture.asset("assets/back_arrow.svg")),
                ),
              ),
            ),
            // Visibility(
            //     visible: widget.isthereback,
            //     child: GestureDetector(
            //         onTap: widget.onBackTap,
            //         child: SvgPicture.asset("assets/back_arrow.svg"))),
            const Spacer(),
            // Image.asset('assets/yes_loyality_log.png'),

            Container(
              constraints: const BoxConstraints(
                maxHeight: 70, // Set maximum height
                maxWidth: 160, // Set maximum width
              ),
              child: Image.asset(
                'assets/yes_loyality_s.png',
                fit: BoxFit
                    .contain, // Maintain aspect ratio while fitting the image within the box
              ),
            ),

            const Spacer(),
            InkWell(
              radius: 233,
              borderRadius: BorderRadius.all(Radius.circular(23)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PopScope(
                      // Allow dismissing the popup on initial back press
                      canPop: true,
                      onPopInvoked: (didPop) {
                        // Check if it's the first back press
                        final isFirstPop = !Navigator.of(context).canPop();

                        if (didPop && isFirstPop) {
                          // Close the dialog without navigation
                          Navigator.of(context)
                              .pop(); // No need for (false) argument
                        }
                      },
                      child: const QrPopup(), // Your dialog content
                    );
                  },
                );
              },
              child: Material(
                color: Colors.transparent, // Ensure the Material is invisible
                child: Container(
                  padding: EdgeInsets.only(
                      left: paddingw20, right: paddingw20, top: 10, bottom: 10),
                  child: Visibility(
                    visible: widget.isthereQr,
                    child: SvgPicture.asset(
                      'assets/qr_code.svg',
                      fit: BoxFit
                          .contain, // Ensure the SVG fits within the 10x10 area
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
