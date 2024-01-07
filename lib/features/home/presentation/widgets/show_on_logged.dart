import 'package:flutter/material.dart';
import '../../../auth/presentation/manager/controller/auth_conroller.dart';

class ShowOnLogged extends StatelessWidget {
  const ShowOnLogged({super.key, required this.loggedWidget, required this.notLoggedWidget});

  final Widget loggedWidget;
  final Widget notLoggedWidget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthController.isLogged(),

        builder: (context, snapshot) {
          if(snapshot.hasData){
            bool isUserLogged = snapshot.data!;

            return isUserLogged
                ? loggedWidget
                : notLoggedWidget;


          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}
