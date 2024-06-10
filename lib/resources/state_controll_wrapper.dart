import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:playandpizza/screens/onboarding.dart';
import 'package:playandpizza/screens/pages_layout.dart';

class AuthStateWrapper extends StatelessWidget {
  const AuthStateWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                if (snapshot.data == null) {
                  return const OnboardingScreen();
                } else {
                  return const PagesLayout(page: 0);
                }
              }
            },);
  }
}
