import 'package:flutter/material.dart';
import 'package:playandpizza/widgets/generic_appbar_widget.dart';
import 'package:playandpizza/widgets/pizza_widget.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppbarWidget(
        title: Container(
          margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
          child: Image.asset(
            'assets/Logo_PNP_Light.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Column(
            children: [
              SizedBox(
                height: 16,
              ),
              PizzaWidget(
                pizzaImage: 'assets/peperoni.png',
                pizzaName: 'Peperoni',
                pizzaPrice: 24,
              ),
              PizzaWidget(
                pizzaImage: 'assets/cheese_onions.png',
                pizzaName: 'Keju & Bawang',
                pizzaPrice: 20,
              ),
              PizzaWidget(
                pizzaImage: 'assets/mushroom.png',
                pizzaName: 'Jamur',
                pizzaPrice: 20,
              ),
              PizzaWidget(
                pizzaImage: 'assets/cheese_tomatoes.png',
                pizzaName: 'Keju & Tomat',
                pizzaPrice: 18,
              ),
              PizzaWidget(
                pizzaImage: 'assets/double_cheese.png',
                pizzaName: 'Keju Mozarella',
                pizzaPrice: 22,
              ),
              PizzaWidget(
                pizzaImage: 'assets/nuggets.png',
                pizzaName: 'Nuget Ayam',
                pizzaPrice: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
