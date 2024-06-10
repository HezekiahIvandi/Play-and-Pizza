import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:playandpizza/screens/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    TextStyle topTextStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    );

    TextStyle bottomTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    );

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                OnboardingPage(
                  imagePath: 'assets/Onboarding Illustration - 1.png',
                  texts: const [
                    'Mainkan Ragam Games',
                    'yang Menarik',
                    'menangkan dan kumpulkan tiket',
                    'sebanyak-banyaknya!'
                  ],
                  topTextStyle: topTextStyle,
                  bottomTextStyle: bottomTextStyle,
                ),
                OnboardingPage(
                  imagePath: 'assets/Onboarding Illustration - 2.png',
                  texts: const [
                    'Menangkan Pizza dan',
                    'Hadiah Gratis',
                    'tukarkan tiket Anda dengan',
                    'beragam pilihan pizza dan hadiah'
                  ],
                  topTextStyle: topTextStyle,
                  bottomTextStyle: bottomTextStyle,
                ),
                OnboardingPage(
                  imagePath: 'assets/Onboarding Illustration - 3.png',
                  texts: const [
                    'Nikmati Pizza Grais',
                    'sambil Bermain',
                    'mainkan games dan dapatkan',
                    'pizza gratis hanya di Play &'
                  ],
                  topTextStyle: topTextStyle,
                  bottomTextStyle: bottomTextStyle,
                ),
              ],
            ),
          ),
          Flex(
            direction: Axis.vertical,
            children: [
              SizedBox(
            height: 20,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const JumpingDotEffect(
                activeDotColor: Color(0xFFBD0000),
                dotColor: Color(0xFFFFC1C1),
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              onPressed: () {
                // Halaman Registration
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(width: 1, color: Colors.white),
                ),
                backgroundColor: const Color(0xFFBD0000),
              ),
              child: const Text(
                'Gabung Sekarang',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sudah punya akun?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Log In
                  Navigator.pushNamed(context, '/login');
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                ),
                child: const Text(
                  ' Masuk disini',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFBD0000),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
            ],
          ),

          
        ],
      ),
    );
  }
}
