import 'package:amam_job_seeker_assessment/features/app_common_widgets/text_view/default_font.dart';
import 'package:amam_job_seeker_assessment/features/app_common_widgets/text_view/text_view.dart';
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