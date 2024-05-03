import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yes_loyality/ui/widgets/buttons.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    double width24 = screenwidth * 24 / FigmaConstants.figmaDeviceWidth;
    double width14 = screenwidth * 14 / FigmaConstants.figmaDeviceWidth;
    double width19 = screenwidth * 19 / FigmaConstants.figmaDeviceWidth;
    double width6 = screenwidth * 6 / FigmaConstants.figmaDeviceWidth;
    double padding12 = screenheight * 12 / FigmaConstants.figmaDeviceHeight;
    return Container(
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
            Text(
              'Kakkanad,',
              style: TextStyles.rubik16black33,
            ),
            Text(
              ' Ernakulam',
              style: TextStyles.rubik16black33w300,
            ),
            const Spacer(),

            InkWell(
              borderRadius: BorderRadius.circular(90),
              onTap: () {
                _showModal(context);
              },
              child: Container(
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
  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
    ),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.2,
            maxChildSize: 0.9,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 1, left: 6),
                          child: Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 92, 91, 90),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
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
                                  onPressed: () {
                                    setState(() {});
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
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      itemCount: 99,
                      itemBuilder: (context, index) {
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
                                                        !Navigator.of(context)
                                                            .canPop();

                                                    if (didPop && isFirstPop) {
                                                      // Close the dialog without navigation
                                                      Navigator.of(context)
                                                          .pop(); // No need for (false) argument
                                                    }
                                                  },
                                                  child:
                                                      const StoreDetails(), // Your dialog content
                                                );
                                              },
                                            );
                                          },
                                          child: SvgPicture.asset(
                                              "assets/Eye icon.svg")),
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
                                      Text("Kerala, India",
                                          style: TextStyles.rubik14black33),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SvgPicture.asset("assets/Line.svg");
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    },
  );
  Widget _buildListItem(int index) {
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
                              child:
                                  const StoreDetails(), // Your dialog content
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

class StoreDetails extends StatelessWidget {
  const StoreDetails({Key? key}) : super(key: key);
  String modifyText(String text) {
    String modifiedText = '';

    for (int i = 0; i < text.length; i += 27) {
      int end = i + 27 < text.length ? i + 27 : text.length;
      modifiedText += text.substring(i, end);
      if (i + 27 < text.length) modifiedText += '\n';
    }

    return modifiedText;
  }

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
          child: Column(
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
                      child: GestureDetector(
                          // onTap: () {
                          //   Navigator.pop(context); // Close the dialog
                          // },
                          child: SvgPicture.asset(
                        "assets/Close.svg",
                      ))),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text("Store Name", style: TextStyles.rubik10grey70),
                  const Spacer(),
                  Text("Ashis Super Mercato",
                      style: TextStyles.rubik10grey70medium),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Store Details", style: TextStyles.rubik10grey70),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 14),
                      Text(modifyText("Shanmugham Rd, Marine Drive, Kochi"),

                          //  "Shanmugham Rd, Marine Drive, Kochi",
                          style: TextStyles.rubik10grey70medium),
                    ],
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
              ColoredButton(text: "View In Map", onPressed: () {}),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
