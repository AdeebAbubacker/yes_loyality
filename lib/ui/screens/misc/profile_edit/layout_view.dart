import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:yes_loyality/core/db/shared/shared_prefernce.dart';
import 'package:yes_loyality/core/view_model/logout/logout_bloc.dart';
import 'package:yes_loyality/core/view_model/profile_edit/profile_edit_bloc.dart';
import 'package:yes_loyality/ui/widgets/appbar.dart';
import 'package:yes_loyality/ui/widgets/buttons.dart';
import 'package:yes_loyality/ui/widgets/number_textfield.dart';

import 'package:yes_loyality/ui/widgets/textfield.dart';
import 'package:path/path.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool _logOutButtonVisible = true;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController addrresscontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  String? fileName = '';
  String? filePath = '';
  bool myVisibility = false;

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filePath = result.files.single.path!;
        fileName = basename(filePath!);
        print("Selected file: $fileName");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double height29 = screenheight * 29 / FigmaConstants.figmaDeviceHeight;
    double height8 = screenheight * 8 / FigmaConstants.figmaDeviceHeight;
    double height22 = screenheight * 22 / FigmaConstants.figmaDeviceHeight;
    double height86 = screenheight * 86 / FigmaConstants.figmaDeviceHeight;
    EdgeInsets outerpadding = OuterPaddingConstant(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 22),
              const HomeAppBar(),
              SizedBox(height: height29),
              Center(
                child: Padding(
                  padding: outerpadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _openFilePicker();
                        },
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: FileImage(File(filePath!)),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: height8),
                      Text(
                        'Jane',
                        style: TextStyles.rubik16red23w700,
                      ),
                      Column(
                        children: _logOutButtonVisible
                            ? [
                                SizedBox(height: height22),
                                Textfield(
                                  hintText: 'Name',
                                  enabled: false,
                                ),
                                SizedBox(height: height22),
                                Textfield(
                                  hintText: 'email',
                                  enabled: false,
                                ),
                                SizedBox(height: height22),
                                NumberTextFieldWithCountry(
                                  enabled: false,
                                  errorText: 'dd',
                                ),
                                SizedBox(height: height86),
                              ]
                            : [
                                SizedBox(height: height22),
                                Textfield(
                                  hintText: 'Name',
                                  textEditingController: namecontroller,
                                ),
                                SizedBox(height: height22),
                                Textfield(
                                  hintText: 'email',
                                  textEditingController: emailcontroller,
                                ),
                                SizedBox(height: height22),
                                NumberTextFieldWithCountry(
                                  errorText: 'dd',
                                  phoneController: phonecontroller,
                                ),
                                SizedBox(height: height86),
                              ],
                      ),
                      _logOutButtonVisible
                          ? SolidColorButton(
                              text: 'Edit Profile',
                              onPressed: () {
                                // Hide log out button when update profile button is clicked
                                setState(() {
                                  _logOutButtonVisible = !_logOutButtonVisible;
                                });
                                // Put your update profile logic here
                              },
                              backgroundColor: const Color(0xFF1B92FF),
                              borderColor: const Color(0xFF1B92FF),
                            )
                          : SolidColorButton(
                              text: 'Save',
                              onPressed: () {
                                // Check if filePath is not null and the file has a valid extension
                                if (filePath != null &&
                                    (filePath!.toLowerCase().endsWith('.jpg') ||
                                        filePath!
                                            .toLowerCase()
                                            .endsWith('.jpeg') ||
                                        filePath!
                                            .toLowerCase()
                                            .endsWith('.png'))) {
                                  // Open the selected file
                                  final file = File(filePath!);

                                  // Create a new instance of FileImage
                                  final image = FileImage(file);

                                  context.read<ProfileEditBloc>().add(
                                        ProfileEditEvent.profileEdit(
                                          name: namecontroller.text,
                                          email: emailcontroller.text,
                                          phone: phonecontroller.text,
                                          image: file,
                                        ),
                                      );

                                  // Hide log out button when update profile button is clicked
                                  setState(() {
                                    print('The file i stored is $file');
                                    _logOutButtonVisible =
                                        !_logOutButtonVisible;
                                  });
                                } else {
                                  // Invalid file extension
                                  print(
                                      'Invalid file format. Please select a JPEG, JPG, or PNG image.');
                                }
                              },
                              backgroundColor: const Color(0xFF2DC962),
                              borderColor: const Color(0xFF2DC962),
                            ),
                      const SizedBox(height: 12),
                      Visibility(
                        visible: _logOutButtonVisible,
                        child: ColorlessButton(
                          onPressed: () async {
                            context
                                .read<LogoutBloc>()
                                .add(const LogoutEvent.logout());
                            await GetSharedPreferences.deleteAccessToken();
                            // ignore: use_build_context_synchronously
                            context.go("/sign_in");
                          },
                          text: 'Log out',
                        ),
                      ),
                      const SizedBox(height: 34)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
