import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playandpizza/model/user.dart' as model;
import 'package:playandpizza/provider/user_provider.dart';
import 'package:playandpizza/utils/color.dart';
import 'package:playandpizza/widgets/games_widget.dart';
import 'package:playandpizza/widgets/generic_appbar_widget.dart';
import 'package:playandpizza/widgets/pizza_home_widget.dart';
import 'package:playandpizza/screens/pages_layout.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  initState() {
    super.initState();
  }

  String _username = "pengguna";
  int _coins = 0;
  int _slices = 0;

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).refreshUser();
    model.User? user = Provider.of<UserProvider>(context).getUser;
    if (user?.username != null) {
      _username = user!.username;
      _coins = user.coins;
      _slices = user.slices;
    }
    return Scaffold(
      appBar: GenericAppbarWidget(
        title: Container(
          margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
          child: Text(
            "Hallo $_username!",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mau memainkan\npermainan apa hari ini?',
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              const Wrap(
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tukar tiket dengan pizza',
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PagesLayout(page: 2),
                        ),
                      );
                    },
                    child: Text(
                      'Selengkapnya',
                      style: GoogleFonts.poppins(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PizzaHomeWidget(
                      pizzaImage: 'assets/peperoni.png',
                      pizzaName: 'Peperoni',
                      pizzaPrice: 8,
                    ),
                    PizzaHomeWidget(
                      pizzaImage: 'assets/cheese_onions.png',
                      pizzaName: 'Keju & Bawang',
                      pizzaPrice: 6,
                    ),
                    PizzaHomeWidget(
                      pizzaImage: 'assets/mushroom.png',
                      pizzaName: 'Jamur',
                      pizzaPrice: 6,
                    ),
                    PizzaHomeWidget(
                      pizzaImage: 'assets/cheese_tomatoes.png',
                      pizzaName: 'Keju & Tomat',
                      pizzaPrice: 8,
                    ),
                    PizzaHomeWidget(
                      pizzaImage: 'assets/double_cheese.png',
                      pizzaName: 'Keju Mozarella',
                      pizzaPrice: 8,
                    ),
                    PizzaHomeWidget(
                      pizzaImage: 'assets/nuggets.png',
                      pizzaName: 'Nuget Ayam',
                      pizzaPrice: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
