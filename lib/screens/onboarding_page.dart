import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final List<String> texts;
  final TextStyle topTextStyle;
  final TextStyle bottomTextStyle;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.texts,
    required this.topTextStyle,
    required this.bottomTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/Logo_PNP_Light.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 25.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      // Log In as Guest
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: const Text(
                      'Lewati',
                      style: TextStyle(
                        color: Color(0xFFFF0000),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Image.asset(
              imagePath,
              width: 400,
              height: 400,
            ),
          ),
          ...texts.asMap().entries.map((entry) {
            int index = entry.key;
            String text = entry.value;
            return Text(
              text,
              style: index < 2 ? topTextStyle : bottomTextStyle,
              textAlign: TextAlign.center,
            );
          }),
        ],
      ),
    );
  }
}
