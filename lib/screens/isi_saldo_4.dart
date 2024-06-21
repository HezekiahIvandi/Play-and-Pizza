import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:playandpizza/screens/pages_layout.dart';
import 'package:playandpizza/widgets/appbar_isisaldo_widget.dart';
import 'package:playandpizza/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/model/user.dart' as model;
import 'package:playandpizza/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IsiSaldo4 extends StatefulWidget {
  final int selectedOption;
  const IsiSaldo4({
    super.key,
    required this.selectedOption,
  });

  @override
  State<IsiSaldo4> createState() => _IsiSaldo4State();
}

void updateCoins(coins) async {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({'coins': coins});
}

class _IsiSaldo4State extends State<IsiSaldo4> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  initState() {
    super.initState();
  }

  int _coins = 0;
  bool updated = false;

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).refreshUser();
    model.User? user = Provider.of<UserProvider>(context).getUser;
    if (user?.username != null) {
      _coins = user!.coins;
      switch (widget.selectedOption) {
        case 0:
          _coins = _coins + 1;
          break;
        case 1:
          _coins = _coins + 5;
          break;
        case 2:
          _coins = _coins + 15;
          break;
        case 3:
          _coins = _coins + 50;
          break;
        case 4:
          _coins = _coins + 100;
          break;
        default:
          break;
      }
      if (!updated) {
        updateCoins(_coins);
        updated = true;
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const AppBarIsiSaldo(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              Center(
                child: Image.asset(
                  'assets/success.png',
                  width: 256,
                  height: 256,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'ISI SALDO\nBERHASIL',
                  style: GoogleFonts.poppins(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 64, 81, 59),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: SizedBox(
                  width: 280,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PagesLayout(page: 0)),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    child: Text(
                      'Kembali ke beranda',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: backgroundColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
