import 'dart:async';
import 'dart:io';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/country_code_adapter/country_code_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
import 'package:Yes_Loyalty/testing/profile_edit_testing.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
import 'package:Yes_Loyalty/ui/screens/home/layout_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/view_model/logout/logout_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/profile_edit/profile_edit_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/name_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/number_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';
import 'package:path/path.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool _isEditable = false;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController addrresscontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  String? fileName = '';
  String? filePath = '';
  bool myVisibility = false;
  String? selectedDialCode = "+61";
  String? selectedCountryCode = "AU";

  var _phoneErrorText;
  bool _formSubmitted = false; // Add this boolean flag
  late final ValueNotifier<UserDetailsDB?> _userDetailsNotifier;
  dynamic img_url;

  @override
  void initState() {
    super.initState();

    _userDetailsNotifier = ValueNotifier<UserDetailsDB?>(null);
    phonecontroller.addListener(_onPhoneChanged);
    _initHive();
  }

  Future<void> _initHive() async {
    // Open the Hive box
    countryCodeBox = await Hive.openBox<CountryCodeDB>('countryCodeBox');
    // Load user details from Hive after the box is opened
    _loadDataFromHive(UserDetailsBox);
    // Load country code after the box is opened
  }

  void _loadDataFromHive(UserDetailsBox) async {
    final customerId = await GetSharedPreferences.getCustomerId();
    final userDetails = UserDetailsBox.get(customerId);
    if (userDetails != null) {
      // Update the text controllers with data from userDetails
      namecontroller.text = userDetails.name;
      emailcontroller.text = userDetails.email;
      phonecontroller.text = userDetails.phone;
      img_url = userDetails.image;
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

  void _submitForm(BuildContext context) async {
    Future.delayed(Duration(seconds: 1), () {
      context
          .read<UserDetailsBloc>()
          .add(const UserDetailsEvent.fetchUserDetails());
      BlocListener<UserDetailsBloc, UserDetailsState>(
          listener: (context, state) async {
        setState(() async {
          UserDetailsBox.put(
            await GetSharedPreferences.getCustomerId(),
            UserDetailsDB(
              customer_id: state.userDetails.data?.customerId.toString(),
              email: state.userDetails.data!.email.toString(),
              image: state.userDetails.data?.imgUrl.toString(),
              name: state.userDetails.data!.name.toString(),
              phone: state.userDetails.data!.phoneNumber.toString(),
              wallet_balance: state.userDetails.data!.walletBalance.toString(),
              wallet_total: state.userDetails.data!.walletTotal.toString(),
              wallet_used: state.userDetails.data!.walletUsed.toString(),
            ),
          );
        });
      });
    });

    showCustomToast(
      context, "Profile updated successfully!",
      MediaQuery.of(context).size.height * 0.7, // Adjust vertical position here
    );
    // Set form submitted and validate phone
    setState(() {
      _formSubmitted =
          true; // Set form submitted to true when the button is clicked
      _validatePhone(phonecontroller.text);
    });

    // Async operations before setState
    final customerId = await GetSharedPreferences.getCustomerId();
    File? file;
    if (filePath != null &&
        (filePath!.toLowerCase().endsWith('.jpg') ||
            filePath!.toLowerCase().endsWith('.jpeg') ||
            filePath!.toLowerCase().endsWith('.png'))) {
      file = File(filePath!);
      await UserDetailsBox.put(
        customerId,
        UserDetailsDB(
          customer_id: customerId,
          name: namecontroller.text,
          email: emailcontroller.text,
          phone: phonecontroller.text,
        ),
      );
      context.read<ProfileEditBloc>().add(
            ProfileEditEvent.profileEdit(
              image: file,
              name: namecontroller.text,
              email: emailcontroller.text,
              phone: phonecontroller.text,
            ),
          );
    } else {
      await UserDetailsBox.put(
        customerId,
        UserDetailsDB(
          customer_id: customerId,
          name: namecontroller.text,
          email: emailcontroller.text,
          phone: phonecontroller.text,
        ),
      );
      context.read<ProfileEditBloc>().add(
            ProfileEditEvent.profileEdit(
              name: namecontroller.text,
              email: emailcontroller.text,
              phone: phonecontroller.text,
            ),
          );
    }

    await UserDetailsBox.put(
      customerId,
      UserDetailsDB(
        customer_id: customerId,
        name: namecontroller.text,
        email: emailcontroller.text,
        phone: phonecontroller.text,
        image: file,
      ),
    );

    // Update state synchronously
    setState(() {
      _isEditable = !_isEditable;
    });
  }

  @override
  Widget build(BuildContext context) {
    context
        .read<UserDetailsBloc>()
        .add(const UserDetailsEvent.fetchUserDetails());
    Future<bool> _onBackPressed() async {
      if (!_isEditable) {
        Navigator.of(context).pop();
      }
      setState(() {
        _isEditable = false;
      });
      // Navigate to SignInScreen if isActive is true
      //  Navigator.of(context).pop();
      return false; // Prevent leaving the screen
    }

    double screenheight = screenHeight(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;
    double height8 = screenheight * 8 / FigmaConstants.figmaDeviceHeight;
    double height22 = screenheight * 22 / FigmaConstants.figmaDeviceHeight;
    double height86 = screenheight * 86 / FigmaConstants.figmaDeviceHeight;
    EdgeInsets outerpadding = OuterPaddingConstant(context);

    return WillPopScope(
      onWillPop: _onBackPressed,
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
                  children: [
                    SizedBox(height: height23),
                    HomeAppBar(
                      isthereback: true,
                      isthereQr: false,
                      onBackTap: _onBackPressed,
                    ),
                    SizedBox(height: height23),
                    Center(
                      child: Padding(
                        padding: outerpadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: !_isEditable
                                  ? null
                                  : () {
                                      _openFilePicker();
                                    },
                              customBorder: const CircleBorder(),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor:
                                    const Color.fromARGB(255, 235, 234, 234),
                                child: filePath != null && filePath!.isNotEmpty
                                    ? ClipOval(
                                        child: Image.file(
                                          File(filePath!),
                                          fit: BoxFit.cover,

                                          width:
                                              77, // Adjusted to fit within the padding
                                          height:
                                              77, // Adjusted to fit within the padding
                                        ),
                                      )
                                    : (img_url != null && img_url.isNotEmpty
                                        ? ClipOval(
                                            child: Image.network(
                                              img_url,
                                              fit: BoxFit.cover,
                                              width:
                                                  77, // Adjusted to fit within the padding
                                              height:
                                                  77, // Adjusted to fit within the padding
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                  ),
                                                );
                                              },
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  const Icon(
                                                Icons.person,
                                                color: Colors.grey,
                                                size: 30,
                                              ),
                                            ),
                                          )
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
                                          )),
                              ),
                            ),
                            SizedBox(height: height8),
                            Text(
                              namecontroller.text,
                              style: TextStyles.rubik16red23w700,
                            ),
                            Column(
                                children: _isEditable
                                    ? [
                                        SizedBox(height: height22),
                                        NameTextfield(
                                          hintText: '',
                                          textstyle: TextStyle(),
                                          textEditingController: namecontroller,
                                        ),
                                        SizedBox(height: height22),
                                        Textfield(
                                          textEditingController:
                                              emailcontroller,
                                        ),
                                        SizedBox(height: height22),
                                        NumberTextFieldWithCountry(
                                            selectedCountryCode: 'AU',
                                            selectedDialCode: '+61',
                                            phoneController: phonecontroller),
                                        // ValueListenableBuilder<
                                        //     Box<CountryCodeDB>>(
                                        //   valueListenable:
                                        //       Hive.box<CountryCodeDB>(
                                        //               'countryCodeBox')
                                        //           .listenable(),
                                        //   builder: (context, box, _) {
                                        //     final countryCodeDB = box.get(0);

                                        //     final dialCode =
                                        //         countryCodeDB?.dial_code ??
                                        //             'AU';
                                        //     final countryCode =
                                        //         countryCodeDB?.country_code ??
                                        //             'AU';
                                        //     return NumberTextFieldWithCountry(
                                        //       selectedCountryCode: dialCode,
                                        //       selectedDialCode: dialCode,
                                        //       errorText: _phoneErrorText,
                                        //       phoneController: phonecontroller,
                                        //     );
                                        //   },
                                        // ),
                                        SizedBox(height: height86),
                                      ]
                                    : [
                                        SizedBox(height: height22),
                                        NameTextfield(
                                          hintText: '',
                                          textstyle:
                                              TextStyles.rubikregular16hint,
                                          enabled: false,
                                          textEditingController: namecontroller,
                                        ),
                                        SizedBox(height: height22),
                                        Textfield(
                                          textstyle:
                                              TextStyles.rubikregular16hint,
                                          textEditingController:
                                              emailcontroller,
                                          enabled: false,
                                        ),
                                        SizedBox(height: height22),
                                        NumberTextFieldWithCountry(
                                            enabled: false,
                                            selectedCountryCode: 'AU',
                                            selectedDialCode: '+61',
                                            phoneController: phonecontroller),
                                        // ValueListenableBuilder<
                                        //     Box<CountryCodeDB>>(
                                        //   valueListenable:
                                        //       Hive.box<CountryCodeDB>(
                                        //               'countryCodeBox')
                                        //           .listenable(),
                                        //   builder: (context, box, _) {
                                        //     final countryCodeDB = box.get(0);

                                        //     final dialCode =
                                        //         countryCodeDB?.dial_code ??
                                        //             'AU';
                                        //     final countryCode =
                                        //         countryCodeDB?.country_code ??
                                        //             'AU';
                                        //     return NumberTextFieldWithCountry(
                                        //       enabled: false,
                                        //       selectedCountryCode: dialCode,
                                        //       selectedDialCode: dialCode,
                                        //       errorText: _phoneErrorText,
                                        //       phoneController: phonecontroller,
                                        //     );
                                        //   },
                                        // ),
                                        SizedBox(height: height86),
                                      ]),
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
                        _isEditable
                            ? MultiBlocListener(
                                listeners: [
                                  BlocListener<ProfileEditBloc,
                                      ProfileEditState>(
                                    listener: (context, state) {
                                      if (state.register != null) {
                                        // Call UserDetailsBloc to fetch user details
                                      }
                                    },
                                  ),
                                  BlocListener<UserDetailsBloc,
                                      UserDetailsState>(
                                    listener: (context, state) async {
                                      if (state.userDetails.data != null) {
                                        Future.delayed(Duration(seconds: 2),
                                            () async {
                                          UserDetailsBox.put(
                                            await GetSharedPreferences
                                                .getCustomerId(),
                                            UserDetailsDB(
                                              customer_id: state
                                                  .userDetails.data?.customerId,
                                              email: state
                                                  .userDetails.data!.email
                                                  .toString(),
                                              image: state
                                                  .userDetails.data?.imgUrl
                                                  .toString(),
                                              name: state.userDetails.data!.name
                                                  .toString(),
                                              phone: state
                                                  .userDetails.data!.phoneNumber
                                                  .toString(),
                                              wallet_balance: state.userDetails
                                                  .data!.walletBalance
                                                  .toString(),
                                              wallet_total: state
                                                  .userDetails.data!.walletTotal
                                                  .toString(),
                                              wallet_used: state
                                                  .userDetails.data!.walletUsed
                                                  .toString(),
                                            ),
                                          );
                                        });
                                      }
                                      if (state.userDetails.data != null) {
                                        // Update the Hive database with new user details
                                        await countryCodeBox.put(
                                          0,
                                          CountryCodeDB(
                                            country_code: state
                                                .userDetails.data!.countryCode
                                                .toString(),
                                            dial_code: state.userDetails.data!
                                                .countryAlphaCode
                                                .toString(),
                                          ),
                                        );

                                        print("Data updated in Hive:");
                                        print(
                                            "Country Code: ${state.userDetails.data!.countryCode}");
                                        print(
                                            "Dial Code: ${state.userDetails.data!.countryAlphaCode}");
                                      }
                                    },
                                  ),

                                  // Add more BlocListeners if needed
                                ],
                                child: SolidColorButton(
                                  text: 'Save',
                                  onPressed: () async {
                                    _submitForm(context);
                                  },
                                  backgroundColor: const Color(0xFF2DC962),
                                  borderColor: const Color(0xFF2DC962),
                                ),
                              )
                            : SolidColorButton(
                                text: 'Edit Profile',
                                onPressed: () {
                                  // Hide log out button when update profile button is clicked
                                  setState(() {
                                    _isEditable = !_isEditable;
                                  });
                                  // Put your update profile logic here
                                },
                                backgroundColor: const Color(0xFF1B92FF),
                                borderColor: const Color(0xFF1B92FF),
                              ),
                        const SizedBox(height: 12),
                        Visibility(
                          visible: !_isEditable,
                          child: ColorlessButton(
                            onPressed: () async {
                              context
                                  .read<LogoutBloc>()
                                  .add(const LogoutEvent.logout());
                              await GetSharedPreferences.deleteAccessToken();
                              await UserDetailsBox.clear();
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
      ),
    );
  }
}
