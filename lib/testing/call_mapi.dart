import 'package:Yes_Loyalty/core/view_model/delete_account/delete_account_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/logout/logout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class CallLogoutBloc  extends StatelessWidget {
//   const CallLogoutBloc ({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Delete Account')),
//       body: BlocProvider(
//         create: (context) => DeleteAccountBloc(),
//         child: BlocConsumer<DeleteAccountBloc, DeleteAccountState>(
//           listener: (context, state) {
//             if (state.isError) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Failed to delete account')),
//               );
//             } else if (!state.isLoading && state.statusCode != 0) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Account deleted successfully')),
//               );
//             }
//           },
//           builder: (context, state) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   if (state.isLoading)
//                     CircularProgressIndicator(),
//                   ElevatedButton(
//                     onPressed: state.isLoading
//                         ? null
//                         : () {
//                             context
//                                 .read<LogoutBloc>()
//                                 .add();
//                           },
//                     child: Text('Delete Account'),
//                   ),
//                   if (state.isError)
//                     Text(
//                       'An error occurred. Please try again.',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:Yes_Loyalty/core/view_model/delete_account/delete_account_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/logout/logout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallLogoutBloc extends StatelessWidget {
  const CallLogoutBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to delete account')),
          );
        } else if (!state.isLoading && state.statusCode != 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Account deleted successfully')),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('data'),
              ElevatedButton(
                  onPressed: () {
                    context.read<LogoutBloc>().add(LogoutEvent.logout());
                  },
                  child: Text('dd'))
            ],
          ),
        ),
      ),
    );
  }
}
