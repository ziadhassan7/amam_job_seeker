import 'package:amam_job_seeker_assessment/futures/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'injection.dart' as inject;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialization
  await inject.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Widget startScreen;

  ///Make App Ready - before building screen
  @override
  void initState() {
    startScreen = const LoginPage();
    super.initState();
  }

  ///Build Screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amam: Job Seeking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        useMaterial3: true,
      ),
      home: startScreen,
    );
  }
}


