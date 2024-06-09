import 'package:flutter/material.dart';
import 'package:playandpizza/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/main.dart';

class AppBarIsiSaldo extends StatelessWidget implements PreferredSizeWidget {
  const AppBarIsiSaldo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      toolbarHeight: 60,
      backgroundColor: backgroundColor,
      scrolledUnderElevation: 0,
      title: Container(
        margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Container(
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
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
