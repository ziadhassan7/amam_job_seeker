import 'package:amam_job_seeker_assessment/futures/auth/presentation/pages/login_page.dart';
import 'package:amam_job_seeker_assessment/futures/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'core/firebase_auth/auth.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,

      builder: (context, snapshot) {
        if(snapshot.hasData){
          return const ProfilePage();
        } else {
          return const LoginPage();
        }

      }
    );
  }
}
