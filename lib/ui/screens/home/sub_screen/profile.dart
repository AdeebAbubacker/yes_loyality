import 'package:flutter/widgets.dart';
import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:yes_loyality/core/db/shared/shared_prefernce.dart';
import 'package:yes_loyality/ui/screens/home/widgets/available_balance.dart';
import 'package:yes_loyality/ui/screens/home/widgets/expense_list.dart';
import 'package:yes_loyality/ui/screens/home/widgets/location_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Function to retrieve QR result from SharedPreferences
  String qrResult = '';
  // Variable to hold the retrieved QR result
  void retrieveQRResult() async {
    String result =
        await GetSharedPreferences.getQRResult() ?? 'Access Token empty';
    setState(() {
      qrResult =
          result; // Update qrResult state variable with the retrieved data
    });
  }

  @override
  Widget build(BuildContext context) {
    retrieveQRResult();
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    double height18 = screenheight * 18 / FigmaConstants.figmaDeviceHeight;
    double height21 = screenheight * 21 / FigmaConstants.figmaDeviceHeight;
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;
    double width15 = screenwidth * 15 / FigmaConstants.figmaDeviceWidth;
    double width20 = screenwidth * 20 / FigmaConstants.figmaDeviceWidth;
    double width30 = screenwidth * 30 / FigmaConstants.figmaDeviceWidth;
    double height10 = screenheight * 10 / FigmaConstants.figmaDeviceHeight;
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: outerpadding,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 255, 128, 130),
                              Color.fromARGB(255, 253, 87, 89),
                              Color.fromARGB(255, 255, 81, 84),
                              Color.fromARGB(255, 249, 58, 62),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: width15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: height18),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/jane.jpg',
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: width15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height18),
                              Text(
                                'Hello Jane',
                                style: TextStyles.rubik18whiteFF,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "jane07@gmail.com",
                                style: TextStyles.rubik14whiteFF,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '3452 1235 7894',
                                style: TextStyles.ibmMono18whiteFF,
                              ),
                              SizedBox(height: height21),
                            ],
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: height18),
                                InkWell(
                                    onTap: () {
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      //   return const ProfileEdit();
                                      // },));

                                      context.push('/profile_edit');
                                    },
                                    child: SvgPicture.asset('assets/edit.svg')),
                              ],
                            ),
                          ),
                          SizedBox(width: width20)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height23),
                  Padding(
                    padding: outerpadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOYALTY DEATILS',
                          style: TextStyles.rubik14black33,
                        ),
                        SizedBox(height: height23),
                        const ExpenseList(
                          image: 'assets/points_received.svg',
                          content: '+12.5% Increase',
                          points: '200',
                          status: 'Total Points Received',
                          isPointRecieved: true,
                        ),
                        const SizedBox(height: 27),
                        const ExpenseList(
                          image: 'assets/points_utilized.svg',
                          content: '-50% Decrease',
                          points: '100',
                          status: 'Total Points Utilized',
                          isPointRecieved: false,
                        ),
                        const SizedBox(height: 27),
                        const AvailableBalance(
                          image: 'assets/available_balance.svg',
                          content: 'Available Balance',
                          points: '100',
                          status: 'Available Balance',
                        ),
                        const SizedBox(height: 15),
                        Text('QR Result: $qrResult'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
