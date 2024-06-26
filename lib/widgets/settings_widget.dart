import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/utils/color.dart';

class SettingsWidget extends StatelessWidget {
  final Icon icon;
  final String description;
  final VoidCallback? buttonFunction;
  const SettingsWidget(
      {super.key,
      required this.icon,
      required this.description,
      this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        icon,
        const SizedBox(
          width: 28,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
              )
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: buttonFunction,
          icon: const Icon(
            Icons.keyboard_arrow_right,
            size: 36,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
