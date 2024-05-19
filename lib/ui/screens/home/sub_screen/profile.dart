import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
import 'package:Yes_Loyalty/ui/screens/home/widgets/available_balance.dart';
import 'package:Yes_Loyalty/ui/screens/home/widgets/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              ProfileSection(),
              SizedBox(height: height23),
              Padding(
                padding: outerpadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LOYALTY DETAILS',
                      style: TextStyles.rubik14black33,
                    ),
                    SizedBox(height: height23),
                    const ExpenseList(
                      image: 'assets/points_received.svg',
                      points: '200',
                      status: 'Total Points Received',
                      isPointRecieved: true,
                    ),
                    const SizedBox(height: 27),
                    const ExpenseList(
                      image: 'assets/points_utilized.svg',
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

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    double height18 = screenheight * 18 / FigmaConstants.figmaDeviceHeight;
    double height21 = screenheight * 21 / FigmaConstants.figmaDeviceHeight;
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;
    double width15 = screenwidth * 15 / FigmaConstants.figmaDeviceWidth;
    double width20 = screenwidth * 20 / FigmaConstants.figmaDeviceWidth;
    double width30 = screenwidth * 30 / FigmaConstants.figmaDeviceWidth;
    double height10 = screenheight * 10 / FigmaConstants.figmaDeviceHeight;
    return Column(
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
            child: Stack(
              children: [
                ValueListenableBuilder<Box<UserDetailsDB>>(
                  valueListenable:
                      Hive.box<UserDetailsDB>('UserDetailsBox').listenable(),
                  builder: (context, box, _) {
                    final branchList = box.values.toList();
                    if (branchList.isEmpty) {
                      return const CircularProgressIndicator();
                    } else {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: width15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: height18),
                              const CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                    child: Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.grey,
                                )),
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
                                'Hello ${branchList[0].name}',
                                style: TextStyles.rubik18whiteFF,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "${branchList[0].email}",
                                style: TextStyles.rubik14whiteFF,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Text(
                                  //   'Customer Id : $customerid',
                                  //   style: TextStyles.ibmMono14whiteFF,
                                  // ),
                                  Text(
                                    'Customer Id :${branchList[0].customer_id}',
                                    style: TextStyles.rubik14whiteFF,
                                  ),
                                  SizedBox(width: 9),
                                  //  IconButton(onPressed: (), icon: icon)
                                  GestureDetector(
                                    onTap: () async {
                                      print("dhjdh");
                                      String textToCopy = "Sample text to copy";

                                      // Copy text to clipboard
                                      await Clipboard.setData(
                                          ClipboardData(text: textToCopy));

                                      // Show toast message
                                      Fluttertoast.showToast(
                                        msg: "Customer Id copied to clipboard",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Color.fromARGB(255, 252, 60, 47),
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                    },
                                    child: Icon(
                                      Icons.copy,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )
                                ],
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
                              ],
                            ),
                          ),
                          SizedBox(width: width20)
                        ],
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        context.push('/profile_edit');
                      },
                      icon: SvgPicture.asset(
                        "assets/Eye icon.svg",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
