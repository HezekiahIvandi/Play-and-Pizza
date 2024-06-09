import 'package:flutter/material.dart';
import 'package:playandpizza/screens/onboarding.dart';
import 'package:playandpizza/screens/pages_layout.dart';
import 'package:playandpizza/screens/signup_screen.dart';
import 'package:playandpizza/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:playandpizza/resources/state_controll_wrapper.dart';

int coins = 837; // initial coin
int slices = 3; // initial slices
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AuthStateWrapper(),
      routes: {
        '/auth': (context) => const AuthStateWrapper(),
        '/home': (context) => const PagesLayout(page: 0),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen()
      },
    );
  }
}
