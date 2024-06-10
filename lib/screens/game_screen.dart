import 'package:flutter/material.dart';
import 'package:playandpizza/model/user.dart' as model;
import 'package:playandpizza/provider/user_provider.dart';
import 'package:playandpizza/widgets/games_widget.dart';
import 'package:playandpizza/widgets/generic_appbar_widget.dart';
import 'package:provider/provider.dart';


class GammeScreen extends StatefulWidget {
  const GammeScreen({super.key});

  @override
  State<GammeScreen> createState() => _GammeScreenState();
}

class _GammeScreenState extends State<GammeScreen> {
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
      appBar: GenericAppbarWidget(title: Container(
          margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
          child: Image.asset(
            'assets/Logo_PNP_Light.png',
            width: 100,
            height: 100,
          ),
        ),),
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
