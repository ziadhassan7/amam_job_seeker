import 'package:amam_job_seeker_assessment/futures/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'injection.dart' as inject;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialization
  await inject.init();

  runApp(const MyApp());
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
    startScreen = const HomePage();
    super.initState();
  }

  ///Build Screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: startScreen,
    );
  }
}


