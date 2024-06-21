// ignore_for_file: use_build_context_synchronously

import 'package:playandpizza/resources/auth_service.dart';
import 'dart:developer';
import 'package:playandpizza/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:playandpizza/widgets/auth_appbar_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();

  //text editing controllers
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const AuthAppBar(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              //TITLE
              const Center(
                child: Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              //EMAIL
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
              AuthTextfield(
                controller: _emailController,
                hintText: 'email',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              //Kata Sandi
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Kata Sandi',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
              AuthTextfield(
                controller: _pwController,
                hintText: 'Kata Sandi',
                obscureText: true,
              ),
              const SizedBox(height: 10),

              //Forgot pass link
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Lupa kata sandi? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/reset');
                    },
                    child: Text(
                      'Klik disini',
                      style: TextStyle(color: Colors.red[700]),
                    ),
                  )
                ],
              ),

              const Flexible(
                  child: SizedBox(
                height: 1000,
              )),

              //Button
              Center(
                child: Column(
                  children: [
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFBD0000), // Hex color code
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              4.0), // Adjust this value to change the roundedness
                        ),
                      ),
                      onPressed: _login,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Masuk ke Beranda'),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/Right Arrow.png',
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Belum punya akun? '),
                        TextButton(
                          onPressed: () {
                            // Log In
                            Navigator.pushNamed(context, '/signup');
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                          ),
                          child: const Text(
                            'Buat disini',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFBD0000),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  gotoHome(BuildContext context) => Navigator.pushNamed(context, '/home');

  _login() async {
    final user = await _auth.loginUserWithEmailAndPassword(
        _emailController.text, _pwController.text);

    if (user != null) {
      log('User logged in successfully');
      Navigator.pushReplacementNamed(context, '/auth');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gagal Masuk'),
        ),
      );
    }
  }
}
