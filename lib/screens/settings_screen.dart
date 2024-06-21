import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/model/user.dart' as model;
import 'package:playandpizza/provider/user_provider.dart';
import 'package:playandpizza/resources/auth_service.dart';
import 'package:playandpizza/utils/color.dart';
import 'package:playandpizza/widgets/generic_appbar_widget.dart';
import 'package:playandpizza/widgets/settings_widget.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _auth = AuthService();
  String _username = "pengguna";
  String _photoUrl =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png';

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).refreshUser();
    model.User? user = Provider.of<UserProvider>(context).getUser;
    if (user?.username != null) {
      _username = user!.username;
      _photoUrl = user.photoUrl;
    }
    return Scaffold(
      appBar: GenericAppbarWidget(
        title: Container(
          margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
          child: Image.asset(
            'assets/Logo_PNP_Light.png',
            width: 100,
            height: 100,
          ),
        ),
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
                      CircleAvatar(
                        backgroundColor: backgroundColor,
                        foregroundImage: NetworkImage(_photoUrl),
                        radius: 76,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        _username,
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
                  description: 'Keluar',
                  buttonFunction: () async {
                    if (user != null) {
                      await _auth.signout();
                    } else {
                      Navigator.pushReplacementNamed(context, '/onboarding');
                    }
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
