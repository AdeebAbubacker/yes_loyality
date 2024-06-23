import 'dart:math';

import 'package:Yes_Loyalty/ui/animations/offer_shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/view_model/offers_list/offers_list_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<Color> baseColors = [];
  List<Color> gradientColors = [];
  Color _generateDarkColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(156), // Limit to 0-155 to ensure dark color
      random.nextInt(156),
      random.nextInt(156),
    );
  }

  Color _generateSlightVariationColor(Color baseColor) {
    HSLColor hslColor = HSLColor.fromColor(baseColor);
    double newLightness =
        (hslColor.lightness + 0.1).clamp(0.0, 0.5); // Ensure it remains dark
    return hslColor.withLightness(newLightness).toColor();
  }

  String _formatExpiryDateWithMonthAsString(String? expiryEnd) {
    if (expiryEnd == null) return '';

    // Parse the expiry date string into a DateTime object
    DateTime expiryDateTime = DateTime.parse(expiryEnd);

    // Get the numeric month and convert it to string representation
    int month = expiryDateTime.month;
    String monthAsString = _getMonthAsString(month);

    // Format the expiry date using the desired format
    String formattedDate =
        DateFormat('d\'${_getDaySuffix(expiryDateTime.day)}\' MMMM yyyy')
            .format(expiryDateTime);

    // Replace the numeric month with its string representation in the formatted date
    formattedDate = formattedDate.replaceFirst(RegExp(r'MMMM'), monthAsString);

    return formattedDate;
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String _getMonthAsString(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<OffersListBloc>()
          .add(const OffersListEvent.fetchOffersList());
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch user details when the widget is built
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   context
    //       .read<OffersListBloc>()
    //       .add(const OffersListEvent.fetchOffersList());
    // });
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    double screenheight = screenHeight(context);
    // double screenwidth = screenWidth(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;

    String formatExpiryDate(String? expiryEnd) {
      if (expiryEnd == null || expiryEnd.isEmpty) {
        return 'Currently Available';
      }

      try {
        DateTime parsedDate = DateTime.parse(expiryEnd);
        String day = DateFormat('d').format(parsedDate);
        String suffix = 'th';

        if (day.endsWith('1') && day != '11') {
          suffix = 'st';
        } else if (day.endsWith('2') && day != '12') {
          suffix = 'nd';
        } else if (day.endsWith('3') && day != '13') {
          suffix = 'rd';
        }

        String formattedDate =
            DateFormat("d'$suffix' MMMM yyyy").format(parsedDate);
        return formattedDate;
      } catch (e) {
        return 'Currently Available';
      }
    }

    return BlocBuilder<OffersListBloc, OffersListState>(
        builder: (context, state) {
      if (state.isLoading) {
        return Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              child: Container(
                height: 110,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      } else if (state.isError) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/offers_error.png')),
          ],
        );
      }
      if (state.offersList.data != null && state.offersList.data!.isNotEmpty) {
        if (baseColors.isEmpty ||
            gradientColors.isEmpty ||
            baseColors.length != state.offersList.data!.length ||
            gradientColors.length != state.offersList.data!.length) {
          baseColors.clear();
          gradientColors.clear();
          for (var i = 0; i < state.offersList.data!.length; i++) {
            Color baseColor = _generateDarkColor();
            baseColors.add(baseColor);
            gradientColors.add(_generateSlightVariationColor(baseColor));
          }
        }
        if (gradientColors.length == state.offersList.data!.length) {
          return SingleChildScrollView(
            child: Column(
              children: [
                MasonryGridView.count(
                  padding: outerpadding,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 19,
                  crossAxisSpacing: 18,
                  itemCount: state.offersList.data?.length ?? 3,
                  itemBuilder: (context, index) {
                    List color1 = const [
                      Color(0xFF328C76),
                      Color(0xFFF5A443),
                      Color(0xFFFFA0BC),
                      Color.fromARGB(255, 82, 171, 255),
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
                      Color(0xFF328C76),
                      Color(0xFFF5A443),
                      Color(0xFFFFA0BC),
                      Color.fromARGB(255, 82, 171, 255),
                    ];
                    String expiryEnd =
                        '${state.offersList.data?[index].expiryEnd}';
                    String formattedDate = formatExpiryDate(expiryEnd);
                    return ContentBox(
                      lineargradient1: baseColors[index],
                      lineargradient2: gradientColors[index],
                      offerinfo: '${state.offersList.data?[index].name}' ??
                          'Special Offer',
                      comments: '${state.offersList.data?[index].comments}' ??
                          'Special Offer',
                      expiryDate:
                          '${formattedDate == "Currently Available" ? 'Currently Available' : 'Valid up to ${formattedDate}'}',
                    );
                  },
                ),
                SizedBox(height: height23),
              ],
            ),
          );
        }
      }

      return SingleChildScrollView(
        child: Column(
          children: [
            MasonryGridView.count(
              padding: outerpadding,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 19,
              crossAxisSpacing: 18,
              itemCount: 13,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    height: 110,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height23),
          ],
        ),
      );
    });
  }
}

class ContentBox extends StatelessWidget {
  final String offerinfo;
  final String comments;
  final String expiryDate;
  final lineargradient1;
  final lineargradient2;
  const ContentBox({
    super.key,
    required this.offerinfo,
    required this.lineargradient1,
    required this.lineargradient2,
    required this.expiryDate,
    required this.comments,
  });
  // final double height;
  String _formatExpiryDateWithMonthAsString(String? expiryEnd) {
    if (expiryEnd == null) return '';

    // Parse the expiry date string into a DateTime object
    DateTime expiryDateTime = DateTime.parse(expiryEnd);

    // Get the numeric month and convert it to string representation
    int month = expiryDateTime.month;
    String monthAsString = _getMonthAsString(month);

    // Format the expiry date using the desired format
    String formattedDate =
        DateFormat('d\'${_getDaySuffix(expiryDateTime.day)}\' MMMM yyyy')
            .format(expiryDateTime);

    // Replace the numeric month with its string representation in the formatted date
    formattedDate = formattedDate.replaceFirst(RegExp(r'MMMM'), monthAsString);

    return formattedDate;
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String _getMonthAsString(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
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
          left: 8,
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
            Text(offerinfo, style: TextStyles.rubik18whiteFFw600),
            const SizedBox(height: 11),
            Text(
              comments,
              style: TextStyles.rubik12whiteFFw400,
            ),
            const SizedBox(height: 11),
            Text(expiryDate, style: TextStyles.rubik9whiteFFw300),
          ],
        ),
      ),
    );
  }
}

class OfferPopup extends StatelessWidget {
  final String expiryDate;
  const OfferPopup({Key? key, this.expiryDate = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: 310,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0XFF1B92FF),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 17, right: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Super Sale',
                          style: TextStyles.regular28whiteFF,
                        ),
                        const SizedBox(height: 20),
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
                            expiryDate,
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
                            data: "yes loyalty",
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
          // Align(
          //     alignment: Alignment.centerRight,
          //     child: GestureDetector(
          //         onTap: () {
          //           Navigator.pop(context); // Close the dialog
          //         },
          //         child: SvgPicture.asset(
          //           "assets/Close.svg",
          //           width: 13,
          //           color: Colors.white,
          //         ))),
          Positioned(
            top: 0,
            right: 0,
            child: Material(
              shape: const CircleBorder(),
              color: Colors.transparent,
              child: IconButton(
                splashRadius: 50,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  "assets/Close.svg",
                  color: Colors.white,
                  width: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BulletPointList extends StatelessWidget {
  const BulletPointList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
