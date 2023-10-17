import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view.dart';
import 'package:flutter/material.dart';
import '../../../core/firebase_auth/auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = Auth().displayName;
    String userEmail = Auth().userEmail;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextView(userName),
            TextView(userEmail),
          ],
        ),
      ),
    );
  }
}
