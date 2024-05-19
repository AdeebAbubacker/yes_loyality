import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/branch_list_adater/branch_list_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/selected_branch_adater/selected_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/branch_list_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

import 'package:Yes_Loyalty/core/view_model/store_details/store_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/store_list/store_list_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/transaction_details/transaction_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/history.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/profile.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/offers.dart';
import 'package:Yes_Loyalty/ui/screens/home/widgets/location_details.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  static final List<Widget> _screens = [
    const History(),
    const Profile(),
    const Offers(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var a = '22';
  List<StoreData> storeDataList = [];

  @override
  void initState() {
    context
        .read<UserDetailsBloc>()
        .add(const UserDetailsEvent.fetchUserDetails());
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      a = GetSharedPreferences.getAccessToken.toString();

      context
          .read<StoreDetailsBloc>()
          .add(StoreDetailsEvent.fetchStoreDetails(storeId: '1'));
      context
          .read<UserDetailsBloc>()
          .add(const UserDetailsEvent.fetchUserDetails());
      _showModal(context);
    });
  }

  Map bankData = {};
  var bank;

  @override
  Widget build(BuildContext context) {
    context
        .read<UserDetailsBloc>()
        .add(const UserDetailsEvent.fetchUserDetails());
    double screenheight = screenHeight(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;
    // Define getData function outside the Timer callback
    void getProfileData() async {
      // Fetch user details
      context.read<StoreListBloc>().state.storeDetails;
    }

    Timer.periodic(const Duration(seconds: 4), (timer) {
      getProfileData(); // Call the function once immediately
    });
// Call getData immediately and then start the periodic timer

    // Fetch user details when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context
          .read<UserDetailsBloc>()
          .add(const UserDetailsEvent.fetchUserDetails());
      context.read<StoreListBloc>().add(const StoreListEvent.fetchStoreList());
    });

    // double screenwidth = screenWidth(context);

    double height22 = screenheight * 22 / FigmaConstants.figmaDeviceHeight;
    double height92 = screenheight * 92 / FigmaConstants.figmaDeviceHeight;
    double height10 = screenheight * 10 / FigmaConstants.figmaDeviceHeight;
    Map<String, dynamic> row = {};

    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: MultiBlocListener(
        listeners: [
          BlocListener<StoreListBloc, StoreListState>(
            listener: (context, state) async {
              for (var store in state.storeDetails.data!) {
                // Create a new StoreData object for each store
                var storeData = StoreData(
                    id: store.id?.toInt() ?? 1,
                    name: store.name.toString(),
                    locality: store.location);
                // Add the StoreData object to the list
                storeDataList.add(storeData);
              }

              // Add data to Hive box
              for (var data in storeDataList) {
                BranchListBox.put(
                  data.id,
                  BranchListDB(
                    id: data.id,
                    selctedBranchName: data.name,
                    locality: data.locality,
                  ),
                );
              }
            },
          ),
          BlocListener<UserDetailsBloc, UserDetailsState>(
            listener: (context, state) async {
              UserDetailsBox.put(
                await GetSharedPreferences.getCustomerId(),
                UserDetailsDB(
                  customer_id: state.userDetails.data?.customerId,
                  email: state.userDetails.data!.email.toString(),
                  image: state.userDetails.data?.image,
                  name: state.userDetails.data!.name.toString(),
                  phone: state.userDetails.data!.phone.toString(),
                ),
              );
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: height23),
                const HomeAppBar(),
                SizedBox(height: height23),
                const LocationDetails(),
                SizedBox(height: height23),
                Expanded(
                  child: _screens[_selectedIndex],
                ),
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: height92, // Set the height to 92 pixels
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: _selectedIndex == 0
                      ? SvgPicture.asset(
                          'assets/bottom_nav/clock.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/bottom_nav/clock.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: _selectedIndex == 1
                      ? SvgPicture.asset(
                          'assets/profile.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset('assets/profile.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcIn,
                          )),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: _selectedIndex == 2
                      ? SvgPicture.asset(
                          'assets/offers.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset('assets/offers.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcIn,
                          )),
                  label: 'Offers',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.red,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Do you want to exit?"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print('yes selected');
                          SystemNavigator.pop();
                          //exit(0);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade800),
                        child: const Text("Yes"),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        // ignore: avoid_print
                        print('no selected');
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text("No",
                          style: TextStyle(color: Colors.black)),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showModal(context) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.5,
              maxChildSize: 0.9,
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Column(
                  children: [
                    const SizedBox(height: 21),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Please select a branch to continue",
                            style: TextStyles.rubik18black33,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 500,
                      height: 1,
                      color: const Color.fromARGB(255, 211, 211, 208),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 14, top: 8, right: 14, bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (searchTerm) {},
                              //style: kCardContentStyle,
                              //
                              decoration: InputDecoration(
                                hintText: "Search Location",
                                contentPadding: const EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(),
                                ),
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: IconButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.eraser,
                                      size: 24,
                                      color: Colors.red,
                                    ),
                                    color: const Color(0xFF1F91E7),
                                    onPressed: () async {
                                      setState(() async {
                                        await GetSharedPreferences
                                            .deleteBranchId();
                                        context
                                            .read<TransactionDetailsBloc>()
                                            .add(const TransactionDetailsEvent
                                                .fetchTransactionDetails());
                                        Navigator.of(context)
                                            .pop(); // Close the bottom sheet
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 9),
                    //   SvgPicture.asset("assets/Line.svg"),
                    ValueListenableBuilder<Box<BranchListDB>>(
                      valueListenable:
                          Hive.box<BranchListDB>('BranchListBox').listenable(),
                      builder: (context, box, _) {
                        final branchList = box.values.toList();
                        if (branchList.isEmpty) {
                          return const CircularProgressIndicator();
                        } else {
                          return Expanded(
                            child: ListView.separated(
                              controller: scrollController,
                              itemCount: branchList.length,
                              itemBuilder: (context, index) {
                                final branch = branchList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    right: 14,
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.of(context)
                                          .pop(); // Close the bottom sheet
                                      await SetSharedPreferences.storeBranchId(
                                          '${branch.id.toString()}');
                                      await selectedBranchBox.put(
                                        'selectedBranchDetail',
                                        SelectedBranchDB(
                                            selctedBranchName:
                                                '${branch.selctedBranchName.toString()}, ${branch.locality.toString()}'),
                                      );
                                      context
                                          .read<TransactionDetailsBloc>()
                                          .add(
                                            const TransactionDetailsEvent
                                                .fetchTransactionDetails(),
                                          );
                                    },
                                    child: SizedBox(
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 23,
                                          top: 2,
                                          right: 23,
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 12),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/Map icon.svg"),
                                                const SizedBox(width: 13),
                                                Text(
                                                  "${branch.selctedBranchName ?? 'hhhhh'}",
                                                  style:
                                                      TextStyles.rubik16black33,
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<
                                                            StoreDetailsBloc>()
                                                        .add(StoreDetailsEvent
                                                            .fetchStoreDetails(
                                                                storeId: branch
                                                                    .id
                                                                    .toString()));
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return PopScope(
                                                          // Allow dismissing the popup on initial back press
                                                          canPop: true,
                                                          onPopInvoked:
                                                              (didPop) {
                                                            // Check if it's the first back press
                                                            final isFirstPop =
                                                                !Navigator.of(
                                                                        context)
                                                                    .canPop();

                                                            if (didPop &&
                                                                isFirstPop) {
                                                              // Close the dialog without navigation
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // No need for (false) argument
                                                            }
                                                          },
                                                          child: StoreDetails(
                                                              storeId: branch.id
                                                                  .toString()), // Your dialog content
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: SvgPicture.asset(
                                                      "assets/Eye icon.svg"),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(width: 27),
                                                Text(
                                                  "${branch.locality?.isEmpty ?? true ? 'Edapally' : branch.locality}, Kerala, India",
                                                  style:
                                                      TextStyles.rubik14black33,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SvgPicture.asset("assets/Line.svg");
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                );
              },
            );
          },
        );
      },
    );
    Widget buildListItem(int index) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
        ),
        child: SizedBox(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 23,
              top: 2,
              right: 23,
            ),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset("assets/Map icon.svg"),
                    const SizedBox(width: 13),
                    Text(
                      "Thrippunithura",
                      style: TextStyles.rubik16black33,
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PopScope(
                                // Allow dismissing the popup on initial back press
                                canPop: true,
                                onPopInvoked: (didPop) {
                                  // Check if it's the first back press
                                  final isFirstPop =
                                      !Navigator.of(context).canPop();

                                  if (didPop && isFirstPop) {
                                    // Close the dialog without navigation
                                    Navigator.of(context)
                                        .pop(); // No need for (false) argument
                                  }
                                },
                                child: const StoreDetails(
                                  storeId: 'h',
                                ), // Your dialog content
                              );
                            },
                          );
                        },
                        child: SvgPicture.asset("assets/Eye icon.svg")),
                    // IconButton(
                    //     onPressed: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (BuildContext context) {
                    //           return PopScope(
                    //             // Allow dismissing the popup on initial back press
                    //             canPop: true,
                    //             onPopInvoked: (didPop) {
                    //               // Check if it's the first back press
                    //               final isFirstPop =
                    //                   !Navigator.of(context)
                    //                       .canPop();

                    //               if (didPop && isFirstPop) {
                    //                 // Close the dialog without navigation
                    //                 Navigator.of(context)
                    //                     .pop(); // No need for (false) argument
                    //               }
                    //             },
                    //             child:
                    //                 const StoreDetails(), // Your dialog content
                    //           );
                    //         },
                    //       );
                    //     },
                    //     icon: SvgPicture.asset(
                    //         "assets/Eye icon.svg")),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 27),
                    Text("Kerala, India", style: TextStyles.rubik14black33),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class StoreData {
  final int id;
  final String name;
  var locality;

  StoreData({
    required this.id,
    required this.name,
    required this.locality,
  });
}

class UsersData {
  dynamic customer_id;
  final String name;
  final String email;
  final String image;

  UsersData({
    required this.customer_id,
    required this.name,
    required this.email,
    required this.image,
  });
}
