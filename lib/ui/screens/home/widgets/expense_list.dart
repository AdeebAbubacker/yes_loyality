import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpenseList extends StatelessWidget {
  final String image;
  final String status;
  final String content;
  final String points;
  final bool isPointRecieved;
  const ExpenseList({
    required this.image,
    required this.status,
    required this.content,
    required this.points,
    required this.isPointRecieved,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Splitting the content into two words
    List<String> words = content.split(' ');
    String firstWord = words.isNotEmpty ? words[0] : '';
    String secondWord = words.length > 1 ? words[1] : '';
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
              Row(
                children: [
                  Text(
                    firstWord,
                    style: isPointRecieved == true
                        ? TextStyles.rubik12greenBD00
                        : TextStyles.rubik12red23,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    secondWord,
                    style: TextStyles.rubik12black00,
                  ),
                ],
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
