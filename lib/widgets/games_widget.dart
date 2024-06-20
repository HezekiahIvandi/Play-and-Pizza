import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/model/user.dart' as model;
import 'package:playandpizza/provider/user_provider.dart';
import 'package:playandpizza/utils/color.dart';
import 'package:provider/provider.dart';

class GamesWidget extends StatelessWidget {
  final String gameImage;
  final String gameName;
  final int gamePrice;

  const GamesWidget(
      {super.key,
      required this.gameImage,
      required this.gamePrice,
      required this.gameName});

  void updateCoins(newCoins) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'coins': newCoins});
  }

  void updateSlices(newSlices) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'slices': newSlices});
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).refreshUser();
    model.User? user = Provider.of<UserProvider>(context).getUser;
    int slices = 0;
    int coins = 0;
    int newCoins = 0;
    if (user?.username != null) {
      coins = user!.coins;
      newCoins = coins - gamePrice;
      slices = user.slices;
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 28,
      height: MediaQuery.of(context).size.width / 2 - 28,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 28,
            height: MediaQuery.of(context).size.width / 2 - 28,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                gameImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withAlpha(0),
                  Colors.black38,
                  Colors.black87
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  gameName,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '$gamePrice koin',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 24,
                  width: 150,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onPressed: () {
                      if (user != null && newCoins >= 0) {
                        updateCoins(newCoins);
                        int newSlices = slices + (gamePrice * 2);
                        updateSlices(newSlices);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gagal Main Permainan'),
                          ),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Main Sekarang',
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
