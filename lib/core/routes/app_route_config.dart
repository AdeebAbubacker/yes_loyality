import 'package:flutter/material.dart';

// Function for navigating to screen 7 while clearing the stack
void navigateTosiginCleared(BuildContext context) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    '/sigin',
    (Route route) => false,
  );
}

void navigateToHomeCleared(BuildContext context) =>
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/home',
      (Route route) => false,
    );

void navigateToSignUp(BuildContext context) =>
    Navigator.of(context).pushNamed('/signup');

void navigateToprofileEdit(BuildContext context) =>
    Navigator.of(context).pushNamed('/profileEdit');

void navigateToUserSettings(BuildContext context) =>
    Navigator.of(context).pushNamed('/userSettings');

void navigateToGetSupport(BuildContext context) =>
    Navigator.of(context).pushNamed('/getSupport');

void navigateToChangePassword(BuildContext context) =>
    Navigator.of(context).pushNamed('/changepassword');

void navigateTodeleteAcc(BuildContext context) =>
    Navigator.of(context).pushNamed('/deleteAccount');
