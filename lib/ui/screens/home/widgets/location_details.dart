import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/branch_list_adater/branch_list_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/selected_branch_adater/selected_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/view_model/store_details/store_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/store_list/store_list_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/transaction_details/transaction_details_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';

class LocationDetails extends StatefulWidget {
  const LocationDetails({
    super.key,
  });

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  late ValueNotifier<String?> _selectedBranchNotifier;

  @override
  void initState() {
    super.initState();
    _selectedBranchNotifier = ValueNotifier(null);
    _getSelectedBranch();
  }

  Future<void> _getSelectedBranch() async {
    try {
      final selectedBranchBox = Hive.box<SelectedBranchDB>('selectedBranchBox');
      final selectedBranch = selectedBranchBox.get('selectedBranchDetail');
      if (selectedBranch != null) {
        _selectedBranchNotifier.value = selectedBranch.selctedBranchName;
      }
    } catch (error) {
      print('Error fetching data from Hive: $error');
      // Handle errors appropriately, e.g., display an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    // Fetch user details when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<StoreListBloc>().add(const StoreListEvent.fetchStoreList());
    });
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    double width24 = screenwidth * 24 / FigmaConstants.figmaDeviceWidth;
    double width14 = screenwidth * 14 / FigmaConstants.figmaDeviceWidth;
    double width19 = screenwidth * 19 / FigmaConstants.figmaDeviceWidth;
    double width6 = screenwidth * 6 / FigmaConstants.figmaDeviceWidth;
    double padding12 = screenheight * 12 / FigmaConstants.figmaDeviceHeight;
    return Padding(
      padding: outerpadding,
      child: InkWell(
        onTap: () {
          _showModal(context);
        },
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              color: const Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(7)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: padding12),
            child: Row(
              children: [
                SizedBox(width: width19),
                SvgPicture.asset("assets/Map icon.svg"),
                SizedBox(width: width6),

                ValueListenableBuilder<Box<SelectedBranchDB>>(
                  valueListenable:
                      Hive.box<SelectedBranchDB>('selectedBranchBox')
                          .listenable(),
                  builder: (context, box, _) {
                    final selectedBranch = box.get('selectedBranchDetail');
                    return Text(
                      selectedBranch?.selctedBranchName ??
                          'Oberon  mall, Kochi',
                      style: TextStyles.rubik16black33,
                    );
                  },
                ),

                const Spacer(),

                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80))),
                  child: Center(
                    child: SizedBox(
                      width: 12,
                      height: 12,
                      child: SvgPicture.asset('assets/dropdown_icon.svg'),
                    ),
                  ),
                ),

                // InkWell(
                //     onTap: () {
                //       _showModal(context);
                //     },
                //     child: SvgPicture.asset('assets/dropdown_icon.svg')),
                //  SizedBox(width: width24)
                SizedBox(
                  width: width14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LocationListItem extends StatelessWidget {
  const LocationListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 50,
        color: Colors.amber,
      ),
    );
  }
}

void _showModal(context) {
  List<BranchListDB> filteredBranchList;
  String searchTerm = '';
  final TextEditingController _textEditingController =
      TextEditingController(); // Define the controller

  showModalBottomSheet(
    // isScrollControlled: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
    ),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.9,
            minChildSize: 0.1, // Set a smaller minChildSize to enable scrolling
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
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
                            controller:
                                _textEditingController, // Assign the controller

                            onChanged: (value) {
                              setState(() {
                                searchTerm = value;
                              });
                            },
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
                                    setState(() {
                                      searchTerm = ''; // Clear the search term
                                      _textEditingController.clear();
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
                  ValueListenableBuilder<Box<BranchListDB>>(
                    valueListenable:
                        Hive.box<BranchListDB>('BranchListBox').listenable(),
                    builder: (context, box, _) {
                      final branchList = box.values.toList();
                      if (branchList.isEmpty) {
                        return const CircularProgressIndicator();
                      } else {
                        if (searchTerm.isNotEmpty) {
                          filteredBranchList = branchList
                              .where((branch) => branch.selctedBranchName
                                  .toLowerCase()
                                  .contains(searchTerm.toLowerCase()))
                              .toList();
                        } else {
                          filteredBranchList = List.from(branchList);
                        }
                        return Expanded(
                          child: ListView.separated(
                            controller: scrollController,
                            itemCount: filteredBranchList.length +
                                1, // Add 1 for the static item
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                // Static item
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  child: InkWell(
                                    onTap: () async {
                                      await GetSharedPreferences
                                          .deleteBranchId();
                                      context
                                          .read<TransactionDetailsBloc>()
                                          .add(const TransactionDetailsEvent
                                              .fetchTransactionDetails());
                                      Navigator.of(context)
                                          .pop(); // Close the bottom sheet
                                    },
                                    child: SizedBox(
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 23, top: 2, right: 23),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 12),
                                            Row(
                                              children: [
                                                const SizedBox(width: 27),
                                                Text(
                                                  "All Transaction Details",
                                                  style:
                                                      TextStyles.rubik16black33,
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(width: 27),
                                                Text(
                                                  "See Transaction in all branches",
                                                  style:
                                                      TextStyles.rubik14black33,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            SvgPicture.asset(
                                                "assets/StaticLine.svg"), // Replace StaticLine with your static line asset
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                // Dynamic items
                                dynamic branch = filteredBranchList[index - 1];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.of(context)
                                          .pop(); // Close the bottom sheet
                                      await SetSharedPreferences.storeBranchId(
                                          branch.id.toString());
                                      await selectedBranchBox.put(
                                        'selectedBranchDetail',
                                        SelectedBranchDB(
                                            selctedBranchName:
                                                '${filteredBranchList[index - 1].selctedBranchName}, ${filteredBranchList[index - 1].locality}'),
                                      );
                                      context
                                          .read<TransactionDetailsBloc>()
                                          .add(const TransactionDetailsEvent
                                              .fetchTransactionDetails());
                                    },
                                    child: SizedBox(
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 23, top: 2, right: 23),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 12),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/Map icon.svg"),
                                                const SizedBox(width: 13),
                                                Text(
                                                  "${branch.selctedBranchName}",
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
                                                          storeId:
                                                              filteredBranchList[
                                                                      index - 1]
                                                                  .id
                                                                  .toString(),
                                                        ));
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
                                                                  .pop();
                                                            }
                                                          },
                                                          child: StoreDetails(
                                                            storeId:
                                                                filteredBranchList[
                                                                        index -
                                                                            1]
                                                                    .id
                                                                    .toString(),
                                                          ), // Your dialog content
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
                              }
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
}

class StoreDetails extends StatelessWidget {
  final String storeId;
  const StoreDetails({Key? key, required this.storeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<StoreDetailsBloc, StoreDetailsState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const CircularProgressIndicator();
              } else if (state.isError) {
                return const Text("Some errro occurred");
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Ashis Super Mercato",
                        style: TextStyles.rubik14black33semibold,
                      ),
                      const Spacer(),
                      Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              icon: SvgPicture.asset(
                                "assets/Close.svg",
                              ))),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Text("Store Name", style: TextStyles.rubik10grey70),
                      const Spacer(),
                      Text(state.storeDetails.data?.name ?? 'erewr',
                          style: TextStyles.rubik10grey70medium),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Store Details",
                              style: TextStyles.rubik10grey70),
                        ],
                      ),
                      const SizedBox(
                        width: 37,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Shanmugham Rd, Marine Drive , Kochi",
                                style: TextStyles.rubik10grey70medium,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Phone", style: TextStyles.rubik10grey70),
                      const Spacer(),
                      Text("0484 236 1403", style: TextStyles.ibmMono10grey33),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Email", style: TextStyles.rubik10grey70),
                      const Spacer(),
                      Text("ashissupermercato@gmail.com",
                          style: TextStyles.rubik10grey70medium),
                    ],
                  ),
                  const SizedBox(
                    height: 43,
                  ),
                  ColoredButton(
                      text: "View In Map",
                      onPressed: () async {
                        await MapsLauncher.launchQuery(
                            state.storeDetails.data?.coordinates.toString() ??
                                "Lulu Mall");
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
