import 'package:carrimen_app/core/constants/common.dart';
import 'package:carrimen_app/core/constants/const.dart';
import 'package:carrimen_app/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    const Screen1(),
    const Screen2(),
    const Screen3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const HomeAppBar(),
            _screens[_selectedIndex],
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 92, // Set the height to 92 pixels
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? SvgPicture.asset('assets/bottom_nav/clock.svg',
                      color: Colors.red)
                  : SvgPicture.asset('assets/bottom_nav/clock.svg',
                      color: Colors.grey),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? SvgPicture.asset('assets/profile.svg', color: Colors.red)
                  : SvgPicture.asset('assets/profile.svg', color: Colors.grey),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? SvgPicture.asset('assets/offers.svg', color: Colors.red)
                  : SvgPicture.asset('assets/offers.svg', color: Colors.grey),
              label: 'Offers',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('History'),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);

    double containerheight =
        screenheight * 113 / FigmaConstants.figmaDeviceHeight;

    return Padding(
      padding: PaddingConstant.outerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: containerheight,
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
              children: [
                const SizedBox(width: 15),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/jane.jpg',
                      fit: BoxFit.cover,
                      width:
                          60, // double the radius to fit the entire image within the circle
                      height: 60,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Jane',
                      style: TextStyles.rubik18whiteFF,
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Let's find your profile",
                      style: TextStyles.rubik14whiteFF,
                    ),
                    SizedBox(height: 10),
                    Text(
                      '3452 1235 7894',
                      style: TextStyles.ibmMono18whiteFF,
                    ),
                  ],
                ),
                const Spacer(),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(width: 20)
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'EXPENSE DEATILS',
            style: TextStyles.rubik14black33,
          ),
          const SizedBox(height: 27),
          const ExpenseList(
            image: 'assets/points_received.svg',
            content: 'Total Points Received',
            points: '200',
            status: 'Total Points Received',
          ),
          const SizedBox(height: 27),
          const ExpenseList(
            image: 'assets/points_utilized.svg',
            content: 'Total Points Utilized',
            points: '100',
            status: 'Total Points Utilized',
          ),
          const SizedBox(height: 27),
          const ExpenseList(
            image: 'assets/available_balance.svg',
            content: 'Available Balance',
            points: '100',
            status: 'Available Balance',
          ),
        ],
      ),
    );
  }
}

class ExpenseList extends StatelessWidget {
  final String image;
  final String status;
  final String content;
  final String points;
  const ExpenseList({
    required this.image,
    required this.status,
    required this.content,
    required this.points,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 71,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(13)),
      child: Row(
        children: [
          const SizedBox(width: 16),
          SvgPicture.asset(image),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: TextStyles.rubik14black33,
              ),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16), // Style for the whole text
                  children: <TextSpan>[
                    TextSpan(
                      text: '+25%', // Text before the percentage
                      style: TextStyles.rubik12greenBD00,
                    ),
                    const TextSpan(
                      text: '', // Percentage sign
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' Increase', // Remaining text
                      style: TextStyles.rubik12black00,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16), // Style for the whole text
              children: <TextSpan>[
                TextSpan(
                  text: points, // Text before the percentage
                  style: TextStyles.rubik16black33w600,
                ),
                TextSpan(
                  text: ' pt', // Percentage sign
                  style: TextStyles.rubik13black33w400,
                ),
              ],
            ),
          ),
          const SizedBox(width: 9)
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Offers'),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenwidth = screenWidth(context);
    final screenheight = screenHeight(context);
    final sizedboxw40 = screenwidth * 40 / FigmaConstants.figmaDeviceWidth;
    final paddingw30 = screenwidth * 30 / FigmaConstants.figmaDeviceWidth;
    final paddingh33 = screenheight * 33 / FigmaConstants.figmaDeviceHeight;
    final paddingh15 = screenheight * 15 / FigmaConstants.figmaDeviceHeight;
    return Padding(
      padding: EdgeInsets.only(
          left: paddingw30,
          right: paddingw30,
          bottom: paddingh15,
          top: paddingh15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          Image.asset('assets/yes_loyality_log.png'),
          const Spacer(),
          SvgPicture.asset('assets/qr_code.svg'),
        ],
      ),
    );
  }
}
