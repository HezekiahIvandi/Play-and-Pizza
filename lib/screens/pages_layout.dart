import 'package:flutter/material.dart';
import 'package:playandpizza/screens/game_screen.dart';
import 'package:playandpizza/screens/home_screen.dart';
import 'package:playandpizza/screens/pizza_screen.dart';
import 'package:playandpizza/screens/settings_screen.dart';
import 'package:playandpizza/utils/color.dart';

class PagesLayout extends StatefulWidget {
  final int page;
  const PagesLayout({
    required this.page,
    super.key,
  });

  @override
  State<PagesLayout> createState() => _PagesLayoutState();
}

class _PagesLayoutState extends State<PagesLayout> {
  late PageController pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _page = widget.page;
    pageController = PageController(initialPage: _page);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          GammeScreen(),
          PizzaScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: _page == 0
                ? const Icon(
                    Icons.home_rounded,
                    color: navIconSelected,
                  )
                : const Icon(
                    Icons.home_rounded,
                    color: navIcon,
                  ),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: _page == 1
                ? const Icon(
                    Icons.gamepad,
                    color: navIconSelected,
                  )
                : const Icon(
                    Icons.gamepad,
                    color: navIcon,
                  ),
            label: 'Permainan',
          ),
          NavigationDestination(
            icon: _page == 2
                ? const Icon(
                    Icons.local_pizza,
                    color: navIconSelected,
                  )
                : const Icon(
                    Icons.local_pizza,
                    color: navIcon,
                  ),
            label: 'Pizza',
          ),
          NavigationDestination(
            icon: _page == 3
                ? const Icon(
                    Icons.settings,
                    color: navIconSelected,
                  )
                : const Icon(
                    Icons.settings,
                    color: navIcon,
                  ),
            label: 'Pengaturan',
          ),
        ],
        onDestinationSelected: navigationTapped,
        backgroundColor: navBackground,
        indicatorColor: navSelected,
        selectedIndex: _page,
        height: 72,
      ),
    );
  }
}
