import 'package:amam_job_seeker_assessment/core/styles/default_font.dart';
import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> init() async {

  //Init default font
  TextViewInit.setDefaultFont(FontFamily.poppins);

  //Init Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}