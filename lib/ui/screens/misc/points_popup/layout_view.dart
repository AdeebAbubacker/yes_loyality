import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PointsCredited extends StatelessWidget {
  const PointsCredited({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    // onTap: () {
                    //   Navigator.pop(context); // Close the dialog
                    // },
                    child: SvgPicture.asset(
                      "assets/Close.svg",
                      width: 20,
                    ))),
            const PaymentStatusWidget(),
            const SizedBox(height: 10),
            const Text(
              'Loyalty Credited',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('200',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
            const Row(
              children: [
                Text('Payment Time',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
                Spacer(),
                Text('25-02-2023, 13:22:16',
                    style: TextStyle(fontSize: 10, color: Colors.black)),
              ],
            ),
            const SizedBox(height: 9),
            const Row(
              children: [
                Text('Invoice ID',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
                Spacer(),
                Text('000085752257',
                    style: TextStyle(fontSize: 10, color: Colors.black)),
              ],
            ),
            const SizedBox(height: 9),
            const Row(
              children: [
                Text('Branch',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
                Spacer(),
                Text('Kakkanad',
                    style: TextStyle(fontSize: 10, color: Colors.black)),
              ],
            ),
            const SizedBox(height: 9),
            const Row(
              children: [
                Text('Payment Method',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
                Spacer(),
                Text('Bank Transfer',
                    style: TextStyle(fontSize: 10, color: Colors.black)),
              ],
            ),
            const SizedBox(height: 9),
          ],
        ),
      ),
    );
  }
}


class PaymentStatusWidget extends StatefulWidget {
  const PaymentStatusWidget({Key? key}) : super(key: key);

  @override
  State<PaymentStatusWidget> createState() => _PaymentStatusWidgetState();
}

class _PaymentStatusWidgetState extends State<PaymentStatusWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000), // Adjust duration as needed
    );

    // Define the animation curve (optional)
    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Define the animation
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curvedAnimation);

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the animation controller when not needed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // Adjust width as needed
      height: 80, // Adjust height as needed
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 240, 255, 248), // Red background color
        borderRadius: BorderRadius.circular(80), // Border radius of 80
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF23A26D),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: const Icon(
                  Icons.check,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 40.0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

