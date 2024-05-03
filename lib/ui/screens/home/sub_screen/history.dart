import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:yes_loyality/ui/screens/home/widgets/location_details.dart';
import 'package:yes_loyality/ui/screens/misc/points_popup/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double height10 = screenheight * 10 / FigmaConstants.figmaDeviceHeight;
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    return Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: outerpadding,
                child: Column(
                  children: [
                    const LocationDetails(),
                    SizedBox(height: height10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '25 December 2023',
                      isdebit: true,
                      points: '100 pt',
                    ),
                    const SizedBox(height: 10),
                    const PointsHistory(
                      date: '16 January 2024',
                      isdebit: false,
                      points: '90 pt',
                    ),
                    SizedBox(height: height10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PointsHistory extends StatelessWidget {
  final String date;
  final bool isdebit;
  final String points;
  const PointsHistory({
    required this.date,
    required this.isdebit,
    required this.points,
    super.key,
  });

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
              child: PointsCredited(), // Your dialog content
            );
          },
        );
      },
      child: Container(
        width: double.infinity,
        height: 76,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: TextStyles.rubik16black33,
                  ),
                  const SizedBox(height: 8),
                  isdebit == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/increment.svg'),
                            const SizedBox(width: 5),
                            Text(
                              'Loyality Debit',
                              style: TextStyles.rubik14black33w300,
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/decrement.svg'),
                            const SizedBox(width: 5),
                            Text(
                              'Loyality Credited',
                              style: TextStyles.rubik14black33w300,
                            ),
                          ],
                        )
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    points,
                    style: TextStyles.rubik16black33,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
