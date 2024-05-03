import 'package:yes_loyality/core/constants/common.dart';
import 'package:flutter/material.dart';

// class Textfield extends StatelessWidget {
//   final String hintText;
//   final TextEditingController textController;
//   const Textfield({
//     super.key,
//     required this.hintText,
//     required this.textController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double elempaddingHorizontal = elemPaddingHorizontal(context);
//     double elempaddingVertical = elemGapVertical(context);
//     return SizedBox(
//       width: double.infinity,
//       height: 57,
//       child: TextField(
//         controller: textController,
//         style: TextStyles.rubikregular16black24w400,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(
//               horizontal: elempaddingHorizontal, vertical: elempaddingVertical),
//           hintText: hintText,
//           hintStyle: TextStyles.rubikregular16grey77w400,
//           border: const OutlineInputBorder(
//             borderSide: BorderSide(
//               width: 4,
//               color: Colors.red,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(9)),
//           ),
//         ),
//       ),
//     );
//   }
// }



class Textfield extends StatelessWidget {
  const Textfield({
    super.key,

    required this.hintText, this.textEditingController,
  });


  final String hintText;
    final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    double elempaddingHorizontal = elemPaddingHorizontal(context);
    double elempaddingVertical = elemGapVertical(context);
    return SizedBox(
      width: double.infinity,
      height: 57,
      child: TextField(
      controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: elempaddingHorizontal, vertical: elempaddingVertical),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
        ),
      ),
    );
  }
}
