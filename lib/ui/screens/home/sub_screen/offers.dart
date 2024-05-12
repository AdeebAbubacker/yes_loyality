import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:yes_loyality/core/view_model/offers_list/offers_list_bloc.dart';
import 'package:yes_loyality/ui/widgets/buttons.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch user details when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<OffersListBloc>().add(const OffersListEvent.fetchOffersList());
    });
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    double screenheight = screenHeight(context);
    // double screenwidth = screenWidth(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;

    return Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  MasonryGridView.count(
                    padding: outerpadding,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 19,
                    crossAxisSpacing: 18,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      List color1 = const [
                        Color(0xFF328C76),
                        Color(0xFFF5A443),
                        Color(0xFFFFA0BC),
                        Color.fromARGB(255, 82, 171, 255),
                      ];
                      List color2 = const [
                        Color(0xFF00B288),
                        Color(0xFFFF9E2D),
                        Color(0xFFFF1B5E),
                        Color.fromARGB(255, 63, 162, 255),
                      ];
                      return ContentBox(
                        lineargradient1: color1[index],
                        lineargradient2: color2[index],
                      );
                    },
                  ),
                  SizedBox(height: height23),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContentBox extends StatelessWidget {
  final lineargradient1;
  final lineargradient2;
  const ContentBox({
    super.key,
    required this.lineargradient1,
    required this.lineargradient2,
  });

  // final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                  Navigator.of(context).pop(); // No need for (false) argument
                }
              },

              child: const OfferPopup(), // Your dialog content
            );
          },
        );
      },
      child: Container(
        width: 200,
        // height: 101,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                lineargradient1,
                lineargradient2,
              ],
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 17,
            top: 17,
            bottom: 17,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Special Offer',
                style: TextStyles.rubik12whiteFFw400,
              ),
              const SizedBox(height: 5),
              Text('25 % OFF', style: TextStyles.rubik18whiteFFw600),
              const SizedBox(height: 11),
              Text('Valid Up to - 1st May 2024',
                  style: TextStyles.rubik9whiteFFw300),
            ],
          ),
        ),
      ),
    );
  }
}

class OfferPopup extends StatelessWidget {
  const OfferPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        width: 310,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0XFF1B92FF),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 17, right: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: SvgPicture.asset(
                              "assets/Close.svg",
                              width: 13,
                              color: Colors.white,
                            ))),
                    Text(
                      'Super Sale',
                      style: TextStyles.regular28whiteFF,
                    ),
                    const SizedBox(height: 4),
                    Text("Up to 10% OFF on all cake orders",
                        style: TextStyles.regular16whiteFF),
                    const SizedBox(height: 14),
                    PopupSectionButton(
                      text: 'Apply code',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 28,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 17, right: 23),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Validity date',
                        style: TextStyles.rubikregular16black33,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Offer valid till 11 May 2024',
                        style: TextStyles.rubikregular14black70,
                      ),
                      const SizedBox(height: 20),
                      const DottedLine(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        lineLength: double.infinity,
                        lineThickness: 2.0,
                        dashLength: 9,
                        dashColor: Color(0xFFA2A2A2),
                        dashRadius: 3,
                        dashGapLength: 4.0,
                        dashGapColor: Colors.transparent,
                        dashGapRadius: 2,
                      ),
                      const SizedBox(height: 20),

                      // Row(
                      //   children: [
                      //     Text(
                      //       "Offer rules",
                      //       style: TextStyles.rubikregular16black33,
                      //     ),
                      //     const Spacer(),
                      //     SvgPicture.asset('assets/dropdown_icon.svg'),
                      //   ],
                      // ),
                      // SizedBox(height: 7),
                      // const BulletPointList(),
                      // const SizedBox(height: 8),
                      // const BulletPointList(),
                      // SizedBox(height: 20),
                      // const DottedLine(
                      //   direction: Axis.horizontal,
                      //   alignment: WrapAlignment.center,
                      //   lineLength: double.infinity,
                      //   lineThickness: 2.0,
                      //   dashLength: 9,
                      //   dashColor: Color(0xFFA2A2A2),
                      //   dashRadius: 3,
                      //   dashGapLength: 4.0,
                      //   dashGapColor: Colors.transparent,
                      //   dashGapRadius: 2,
                      // ),
                      // SizedBox(height: 14),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "Terms & conditions",
                      //       style: TextStyles.rubikregular16black33,
                      //     ),
                      //     const Spacer(),
                      //     SvgPicture.asset('assets/dropdown_icon.svg'),
                      //   ],
                      // ),
                      // const SizedBox(height: 20)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      QrImageView(
                        data: "yes loyality",
                        size: 120,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class BulletPointList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 200,
//       child:

//        ListView(
//         shrinkWrap: true,
//         children: <Widget>[
//           ListTile(
//             leading: Icon(
//               Icons.circle,
//               size: 6,
//               weight: 6,
//             ),
//             title: Text(
//                 'Item zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
//           ),
//           ListTile(
//             leading: Icon(Icons.circle),
//             title: Text('Item 2'),
//           ),
//           ListTile(
//             leading: Icon(Icons.circle),
//             title: Text('Item 3'),
//           ),
//         ],
//       ),
//     );
//   }
// }

class BulletPointList extends StatelessWidget {
  const BulletPointList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Align icon vertically centered
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: Icon(
                Icons.circle,
                size: 6,
                color: Color(0XFFA2A2A2),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                // Use Wrap widget for text wrapping
                children: [
                  Text(
                      "Donec vel tortor quis justo iaculis elementum sit amet vel magna.",
                      style: TextStyles.rubiklight14grey70),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
