import 'package:app2/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:app2/widgets/appbar_widget.dart';

class LoginScreen extends StatelessWidget {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController konfirmasiPwController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AuthAppBar(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TITLE
              const Center(
                child: Text(
                  "Registrasi",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              //USERNAME
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Username',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
              AuthTextfield(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              //EMAIL
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
              AuthTextfield(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              //PASSWORD
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
              AuthTextfield(
                controller: pwController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),

              //konfirmasi PASSWORD
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Konfirmasi Password',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
              AuthTextfield(
                controller: konfirmasiPwController,
                hintText: 'Konfirmasi password',
                obscureText: true,
              ),
              const SizedBox(height: 10),

              Flexible(
                  child: SizedBox(
                height: 200,
              )),

              //Button
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFBD0000), // Hex color code
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust this value to change the roundedness
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 120),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Text('Gabung sekarang'),
                        ],
                      ),
                    ),
                    const Text('Sudah punya akun? masuk disini')
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
