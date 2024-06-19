import 'package:playandpizza/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:playandpizza/widgets/auth_appbar_widget.dart';
import 'package:playandpizza/resources/auth_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = AuthService();

  //text editing controllers
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _pwController = TextEditingController();

  final TextEditingController _konfirmasiPwController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

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
                  'Nama Akun',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
              AuthTextfield(
                controller: _usernameController,
                hintText: 'Nama Akun',
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
                controller: _emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              //PASSWORD
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

              //konfirmasi PASSWORD
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Konfirmasi Kata Sandi',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
              AuthTextfield(
                controller: _konfirmasiPwController,
                hintText: 'Konfirmasi Kata Sandi',
                obscureText: true,
              ),
              const SizedBox(height: 10),

              const Flexible(
                  child: SizedBox(
                height: 200,
              )),

              //Button
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          _signup;
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side:
                                const BorderSide(width: 1, color: Colors.white),
                          ),
                          backgroundColor: const Color(0xFFBD0000),
                        ),
                        child: const Text(
                          'Gabung Sekarang',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sudah punya akun? '),
                        TextButton(
                          onPressed: () {
                            // Log In
                            Navigator.pushNamed(context, '/login');
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                          ),
                          child: const Text(
                            'Masuk disini',
                            style: TextStyle(
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

  gotoLogin(BuildContext context) => Navigator.pushNamed(context, '/login');

  void _signup() async {
    String res = await AuthService().createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _pwController.text,
      username: _usernameController.text,
    );
    if (res == "success") {
      Navigator.pushNamed(context, '/auth');
    }
  }
}
