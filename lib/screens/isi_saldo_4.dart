import 'package:flutter/material.dart';
import 'package:playandpizza/screens/pages_layout.dart';
import 'package:playandpizza/widgets/appbar_isisaldo_widget.dart';
import 'package:playandpizza/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';

class IsiSaldo4 extends StatefulWidget {
  const IsiSaldo4({super.key});

  @override
  State<IsiSaldo4> createState() => _IsiSaldo4State();
}

class _IsiSaldo4State extends State<IsiSaldo4> {
  @override
  Widget build(BuildContext context) {
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
