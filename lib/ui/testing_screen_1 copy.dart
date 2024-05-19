import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  void _displaySuccessMotionToast() {
    MotionToast toast = MotionToast(
      primaryColor: Colors.red,
      description: const Text(
        'This is a description example',
        style: TextStyle(fontSize: 12),
      ),
      dismissable: true,
      displaySideBar: false,
    );
    toast.show;
    // Future.delayed(const Duration(seconds: 4)).then((value) {
    //   toast.closeOverlay();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton(
              onPressed: () {
                _displaySuccessMotionToast();
              },
              child: const Text('Success Motion Toast'),
            ),
          ],
        ),
      ),
    );
  }
}
