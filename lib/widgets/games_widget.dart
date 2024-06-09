import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/utils/color.dart';

class GamesWidget extends StatelessWidget {
  final String gameImage;
  final String gameName;
  final String gamePrice;

  const GamesWidget(
      {super.key,
      required this.gameImage,
      required this.gamePrice,
      required this.gameName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          SizedBox(
            width: 175,
            height: 175,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/minigames.png',
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
                  '100 coins',
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
                    onPressed: () {},
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
