import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/view_model/get_support/get_support_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/message_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetSupportScreen extends StatefulWidget {
  const GetSupportScreen({super.key});

  @override
  State<GetSupportScreen> createState() => _GetSupportScreenState();
}

class _GetSupportScreenState extends State<GetSupportScreen> {
  String? _emailErrorText;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController messagetcontroller = TextEditingController();
final FocusNode namefocusNode = FocusNode();
final FocusNode emailfocusNode = FocusNode();
final FocusNode subjectfocusNode = FocusNode();
final FocusNode messagefocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double devicePadding = outerPadding(context);

    double elementPaddingVertical = elemPaddingVertical(context);
    double perc20 = screenHeight * 0.020; // 2.00% of the screen height
    double perc187 = screenHeight * 0.0187; // 1.87% of the screen height

    return BlocListener<GetSupportBloc, GetSupportState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (message) {
            setState(() {
              _emailErrorText = null;
            });
            return GetSupportPopup(context,
                message: message.message.toString());
          },
          failure: (error) {
            print("Failure: $error");
          },
          validationError: (message) {
            setState(() {
              _emailErrorText = message;
            });
            print("Validation Error: $message");
          },
          orElse: () {},
        );
      },
      child: GestureDetector(
        onTap: (){
        namefocusNode.unfocus();
 emailfocusNode .unfocus();
 subjectfocusNode.unfocus();
 messagefocusNode.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      HomeAppBar(
                        onBackTap: () async {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "Contact Us",
                          style: TextStyles.rubik20black33w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: devicePadding),
                        child: Column(
                          children: [
                            Textfield(
                              focusNode:namefocusNode,
                              // errorText: _emailErrorText,
                              hintText: 'name*',
                              textEditingController: namecontroller,
                            ),
                            SizedBox(height: elementPaddingVertical),
                            Textfield(
                              focusNode: emailfocusNode,
                              errorText: _emailErrorText,
                              hintText: 'Email*',
                              textEditingController: emailcontroller,
                            ),
                            SizedBox(height: elementPaddingVertical),
                            Textfield(
                              focusNode: emailfocusNode,
                              // errorText: _emailErrorText,
                              hintText: 'subject*',
                              textEditingController: subjectcontroller,
                            ),
                            SizedBox(height: elementPaddingVertical),
                            MessageTextfield(
                              focusNode: messagefocusNode,
                              hintText: 'message*',
                              textEditingController: messagetcontroller,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: perc187),
                      SizedBox(height: perc187),
                      SizedBox(height: perc20),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ColoredButton(
                      onPressed: () {
                        context.read<GetSupportBloc>().add(
                            GetSupportEvent.getSupport(
                                name: namecontroller.text,
                                email: emailcontroller.text,
                                subject: subjectcontroller.text,
                                message: messagetcontroller.text));
                      },
                      text: 'Contact Us',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> GetSupportPopup(context, {required String message}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          width: 90,
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${message} we will get back soon"),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFF6D70),
                        Color(0xFFEE1F23),
                      ],
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "Close",
                    style: TextStyles.rubikmedium16whiteFF,
                  )),
                ),
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      );
    },
  );
}
