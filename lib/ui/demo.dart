import 'package:flutter/material.dart';
import 'package:yes_loyality/core/services/api_services.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  print("object");
                
                     // BlocProvider.of<RegisterBloc>(context)
                  //     .add(RegisterEvent.register());
                },
                child: Text("Call Api"))
          ],
        ),
      ),
    );
  }
}
