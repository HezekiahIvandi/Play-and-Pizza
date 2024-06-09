import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Text20500 extends StatelessWidget {
  final String text;
  const Text20500({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
