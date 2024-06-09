import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/resources/auth_service.dart';
import 'package:playandpizza/main.dart';
import 'package:playandpizza/utils/color.dart';
import 'package:playandpizza/widgets/settings_widget.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Container(
          margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
          child: Image.asset(
            'assets/Logo_PNP_Light.png',
            width: 100,
            height: 100,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Redirect Ke Top UP
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
              width: 150,
              height: 45,
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$coins',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: backgroundColor),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Image.asset(
                      'assets/coin.png',
                      width: 32,
                      height: 32,
                    ),
                  ),
                  Text(
                    '$slices',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: backgroundColor),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Image.asset(
                      'assets/slices.png',
                      width: 16,
                      height: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 240,
                  width: 360,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      const CircleAvatar(
                        backgroundColor: backgroundColor,
                        foregroundImage: AssetImage('assets/profile.png'),
                        radius: 76,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Pengguna',
                        style: GoogleFonts.poppins(
                          color: backgroundColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  'Pengaturan',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                const SettingsWidget(
                  icon: Icon(
                    Icons.person_outline,
                    size: 36,
                  ),
                  description: 'Informasi Akun',
                ),
                const SizedBox(
                  height: 20,
                ),
                const SettingsWidget(
                  icon: Icon(
                    Icons.credit_card,
                    size: 36,
                  ),
                  description: 'Metode Pembayaran',
                ),
                const SizedBox(
                  height: 20,
                ),
                const SettingsWidget(
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    size: 36,
                  ),
                  description: 'Notifikasi',
                ),
                const SizedBox(
                  height: 20,
                ),
                SettingsWidget(
                  icon: const Icon(
                    Icons.logout_outlined,
                    size: 36,
                  ),
                  description: 'Logout',
                  buttonFunction: () async {
                    await _auth.signout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
