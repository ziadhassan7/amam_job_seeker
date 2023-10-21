import 'package:flutter/material.dart';
import '../../../../core/styles/app_screen.dart';
import '../views/desktop_view.dart';
import '../views/mobile_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(

        child: _getAdaptiveWidget(context)
      ),
    );
  }

  // Decide which screen to show user
  static _getAdaptiveWidget(BuildContext context){
    final screenWidth = AppScreen(context).width;

    return (screenWidth > 700)
        ? const DesktopView()
        : const MobileView();
  }
}
