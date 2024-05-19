import 'dart:io';

import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/view_model/logout/logout_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/profile_edit/profile_edit_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/register/register_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/name_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/number_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';
import 'package:motion_toast/motion_toast.dart';
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
  var _phoneErrorText;
  bool _formSubmitted = false; // Add this boolean flag
  late final ValueNotifier<UserDetailsDB?> _userDetailsNotifier;

  @override
  void initState() {
    super.initState();
    _userDetailsNotifier = ValueNotifier<UserDetailsDB?>(null);
    phonecontroller.addListener(_onPhoneChanged);
    _initHive();
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    final box = await Hive.openBox<UserDetailsDB>('UserDetailsBox');
    _loadDataFromHive(box);
  }

  void _loadDataFromHive(Box<UserDetailsDB> box) async {
    final customerId = await GetSharedPreferences.getCustomerId();
    final userDetails = box.get(customerId);
    if (userDetails != null) {
      // Update the text controllers with data from userDetails
      namecontroller.text = userDetails.name;
      emailcontroller.text = userDetails.email;
      phonecontroller.text = userDetails.phone;
    }
    setState(() {
      _userDetailsNotifier.value = userDetails;
    });
  }

  @override
  void dispose() {
    phonecontroller.removeListener(_onPhoneChanged);
    super.dispose();
  }

  void _onPhoneChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validatePhone(phonecontroller.text);
    }
  }

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

  void _validatePhone(String value) {
    setState(() {
      if (value.isEmpty) {
        _phoneErrorText = 'Phone no is required';
      } else if (value.length < 10) {
        _phoneErrorText = 'Phone no must be at least 10 characters long';
      } else {
        _phoneErrorText = null;
      }
    });
  }



  void _displaySuccessMotionToast(BuildContext context) {
    MotionToast toast = MotionToast(
  
   toastDuration: Duration(seconds: 5),
      position: MotionToastPosition.center,
      contentPadding: EdgeInsets.only(left: 9, right: 9),
      animationType: AnimationType.fromLeft,
      animationDuration: Duration(seconds: 10),
      primaryColor: const Color.fromARGB(255, 234, 36, 22),
      description: const Text(
        'User Details Saved Successully',
        style: TextStyle(fontSize: 12),
      ),
      dismissable: true,
      displaySideBar: false,
    );
    toast.show(context);
    // Future.delayed(const Duration(seconds: 4)).then((value) {
    //   toast.closeOverlay();
    // });
  }


  void _submitForm(BuildContext context) async {
     _displaySuccessMotionToast(context);
    setState(() async{
      _formSubmitted =
          true; // Set form submitted to true when the button is clicked

      _validatePhone(phonecontroller.text);
          // Show toast message
   await MotionToast(
      layoutOrientation: ToastOrientation.ltr,
      
      contentPadding: EdgeInsets.only(left: 9, right: 9),
      animationType: AnimationType.fromLeft,
      animationDuration: Duration(seconds: 10),
      primaryColor: Colors.red,
      description: const Text(
        'User Details Saved Successully',
        style: TextStyle(fontSize: 12),
      ),
      dismissable: true,
      displaySideBar: false,
    );
    });
    // Check if filePath is not null and the file has a valid extension
    if (filePath != null &&
        (filePath!.toLowerCase().endsWith('.jpg') ||
            filePath!.toLowerCase().endsWith('.jpeg') ||
            filePath!.toLowerCase().endsWith('.png'))) {
      // Open the selected file
      final file = File(filePath!);

      // Create a new instance of FileImage
      final image = FileImage(file);

      // Conditionally pass the image parameter
      context.read<ProfileEditBloc>().add(
            ProfileEditEvent.profileEdit(
              name: namecontroller.text,
              email: emailcontroller.text,
              phone: phonecontroller.text,
              image: file,
            ),
          );
      setState(() async {
        UserDetailsBox.put(
          await GetSharedPreferences.getCustomerId(),
          UserDetailsDB(
            customer_id: await GetSharedPreferences.getCustomerId(),
            name: namecontroller.text,
            email: emailcontroller.text,
            phone: phonecontroller.text,
            image: file,
          ),
        );
      });

      // Fetch user details when the widget is built
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        context
            .read<UserDetailsBloc>()
            .add(const UserDetailsEvent.fetchUserDetails());
      });

      // Hide log out button when update profile button is clicked
      setState(() {
        print('The file i stored is $file');
        _logOutButtonVisible = !_logOutButtonVisible;
      });
    } else {
      // No file selected or invalid file extension
      print('Please select a valid JPEG, JPG, or PNG image.');

      // If no file is selected or invalid, call the profileEdit event without the image parameter
      context.read<ProfileEditBloc>().add(
            ProfileEditEvent.profileEdit(
              name: namecontroller.text,
              email: emailcontroller.text,
              phone: phonecontroller.text,
            ),
          );
      setState(() async {
        UserDetailsBox.put(
          await GetSharedPreferences.getCustomerId(),
          UserDetailsDB(
            customer_id: await GetSharedPreferences.getCustomerId(),
            name: namecontroller.text,
            email: emailcontroller.text,
            phone: phonecontroller.text,
            //  image: file,
          ),
        );
      });

      // Hide log out button when update profile button is clicked
      setState(() {
        _logOutButtonVisible = !_logOutButtonVisible;
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;
    double height8 = screenheight * 8 / FigmaConstants.figmaDeviceHeight;
    double height22 = screenheight * 22 / FigmaConstants.figmaDeviceHeight;
    double height86 = screenheight * 86 / FigmaConstants.figmaDeviceHeight;
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(height: height23),
                  HomeAppBar(
                    isthereQr: false,
                    onBackTap: () {
                      Navigator.of(context).pop(); // Pop to the "/home" route
                    },
                  ),
                  SizedBox(height: height23),
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
                              backgroundColor:
                                  const Color.fromARGB(255, 235, 234, 234),
                              backgroundImage:
                                  filePath != null && filePath!.isNotEmpty
                                      ? FileImage(File(filePath!))
                                      : null,
                              child: filePath != null && filePath!.isNotEmpty
                                  ? null
                                  : ClipOval(
                                      child: Container(
                                        color: const Color.fromARGB(
                                            255, 235, 234, 234),
                                        child: const Icon(
                                          Icons.person,
                                          size: 59,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(height: height8),
                          Text(
                            '${namecontroller.text ?? 'Jane'}',
                            style: TextStyles.rubik16red23w700,
                          ),
                          Column(
                            children: _logOutButtonVisible
                                ? [
                                    SizedBox(height: height22),
                                    NameTextfield(
                                      enabled: false,
                                      hintText: 'Name',
                                      textEditingController: namecontroller,
                                    ),
                                    SizedBox(height: height22),
                                    Textfield(
                                      hintText: 'email',
                                      textEditingController: emailcontroller,
                                      enabled: false,
                                    ),
                                    SizedBox(height: height22),
                                    NumberTextFieldWithCountry(
                                      textstyle: TextStyles.rubikregular16hint,
                                      enabled: false,
                                      errorText: 'dd',
                                      phoneController: phonecontroller,
                                    ),
                                    SizedBox(height: height86),
                                  ]
                                : [
                                    SizedBox(height: height22),
                                    NameTextfield(
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
                                      errorText: _phoneErrorText,
                                      phoneController: phonecontroller,
                                    ),
                                    SizedBox(height: height86),
                                  ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: outerpadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                              onPressed: () async {
                                _submitForm(context);
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
            ),
          ],
        ),
      ),
    );
  }
}
