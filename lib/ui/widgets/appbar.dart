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
  const HomeAppBar({
    super.key,
    this.isthereQr = true,
    this.isthereback = true,
    this.onBackTap,
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

    return Padding(
      padding: EdgeInsets.only(
        left: paddingw30,
        right: paddingw10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
              visible: widget.isthereback,
              child: GestureDetector(
                  onTap: widget.onBackTap,
                  child: SvgPicture.asset("assets/back_arrow.svg"))),
          const Spacer(),
          Image.asset('assets/yes_loyality_log.png'),
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
          // InkWell(
          //   borderRadius: BorderRadius.circular(90),
          //   onTap: () {
          //     // scanQR();
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext context) {
          //         return PopScope(
          //           // Allow dismissing the popup on initial back press
          //           canPop: true,
          //           onPopInvoked: (didPop) {
          //             // Check if it's the first back press
          //             final isFirstPop = !Navigator.of(context).canPop();

          //             if (didPop && isFirstPop) {
          //               // Close the dialog without navigation
          //               Navigator.of(context)
          //                   .pop(); // No need for (false) argument
          //             }
          //           },
          //           child: const QrPopup(), // Your dialog content
          //         );
          //       },
          //     );
          //   },
          //   child: Container(
          //     width: 70,
          //     height: 70,
          //     decoration: const BoxDecoration(
          //         borderRadius: BorderRadius.all(Radius.circular(80))),
          //     padding: const EdgeInsets.all(
          //         20), // Adjust padding to center the image within the InkWell
          //     child: Center(
          //       child: SizedBox(
          //         width: 25,
          //         height: 25,
          //         child: SvgPicture.asset(
          //           'assets/qr_code.svg',
          //           fit: BoxFit
          //               .contain, // Ensure the SVG fits within the 10x10 area
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
