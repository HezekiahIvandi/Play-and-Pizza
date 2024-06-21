import 'package:flutter/material.dart';
import 'package:playandpizza/model/user.dart' as model;
import 'package:playandpizza/provider/user_provider.dart';
import 'package:playandpizza/screens/isi_saldo_1.dart';
import 'package:playandpizza/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GenericAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget title;
  const GenericAppbarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    int coins = 0;
    int slices = 0;
    Provider.of<UserProvider>(context, listen: false).refreshUser();
    model.User? user = Provider.of<UserProvider>(context).getUser;
    if (user?.username != null) {
      coins = user!.coins;
      slices = user.slices;
    }
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      backgroundColor: backgroundColor,
      scrolledUnderElevation: 0,
      title: title,
      actions: [
        GestureDetector(
          onTap: () {
            if (user != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IsiSaldo1()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Masuk Terlebih Dahulu'),
                ),
              );
            }
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
                    'assets/pizza_ticket.png',
                    width: 32,
                    height: 32,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
