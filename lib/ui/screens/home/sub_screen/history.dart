import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:yes_loyality/core/view_model/transaction_details/transaction_details_bloc.dart';
import 'package:yes_loyality/ui/screens/home/widgets/location_details.dart';
import 'package:yes_loyality/ui/screens/misc/points_popup/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch user details when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context
          .read<TransactionDetailsBloc>()
          .add(const TransactionDetailsEvent.fetchTransactionDetails());
    });
    double screenheight = screenHeight(context);
    double height10 = screenheight * 10 / FigmaConstants.figmaDeviceHeight;
 
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
                child: Column(
          children: [
           
            BlocBuilder<TransactionDetailsBloc, TransactionDetailsState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const CircularProgressIndicator();
                } else if (state.isError) {
                  return const Text("ITS ERROR");
                } else if (state.transactionDetails.data == null) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  );
                } else if (state.transactionDetails.data!.isEmpty) {
                  return const CircularProgressIndicator();
                } else if (state.transactionDetails.data!.isNotEmpty) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.transactionDetails.data?.length ?? 3,
                  
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: PointsHistory(
                          date: '25 December 2023',
                          isCredited:
                              state.transactionDetails.data?[index].coinType ==
                                      "credit"
                                  ? true
                                  : false,
                          points:
                              '${state.transactionDetails.data?[index].coins.toString()} pts',
                        ),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
            SizedBox(height: height10),
          ],
        ))),
      ],
    );
  }
}

class PointsHistory extends StatelessWidget {
  final String date;
  final bool isCredited;
  final String points;
  const PointsHistory({
    required this.date,
    required this.isCredited,
    required this.points,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    return Padding(
      padding: outerpadding,
      child: InkWell(
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
                child: const PointsCredited(), // Your dialog content
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
                    isCredited == true
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset('assets/increment.svg'),
                              const SizedBox(width: 5),
                              Text(
                                'Loyality Credited',
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
                                'Loyality Debited',
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
      ),
    );
  }
}
