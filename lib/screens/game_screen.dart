import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/main.dart';
import 'package:playandpizza/screens/isi_saldo_1.dart';
import 'package:playandpizza/widgets/games_widget.dart';

import '../utils/color.dart';

class GammeScreen extends StatefulWidget {
  const GammeScreen({super.key});

  @override
  State<GammeScreen> createState() => _GammeScreenState();
}

class _GammeScreenState extends State<GammeScreen> {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IsiSaldo1()),
              );
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
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: const Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              GamesWidget(
                gameImage: '',
                gameName: 'Minigame 1',
                gamePrice: '1 coins',
              ),
              GamesWidget(
                gameImage: '',
                gameName: 'Minigame 2',
                gamePrice: '2 coins',
              ),
              GamesWidget(
                gameImage: '',
                gameName: 'Minigame 3',
                gamePrice: '1 coins',
              ),
              GamesWidget(
                gameImage: '',
                gameName: 'Minigame 4',
                gamePrice: '3 coins',
              ),
              GamesWidget(
                gameImage: '',
                gameName: 'Minigame 5',
                gamePrice: '2 coins',
              ),
              GamesWidget(
                gameImage: '',
                gameName: 'Minigame 6',
                gamePrice: '1 coins',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
