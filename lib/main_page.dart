import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upc_2022/shop_cleaning.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onMenuItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List classes = [
    const ShopCleaning(),
    const Cleaners(),
    const Bonuses(),
    const Help()
  ];

  @override
  Widget build(BuildContext context) {
    var menu = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.cleaning_services), label: "Заказы"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "Клинеры"),
        BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard), label: "Бонусы"),
        BottomNavigationBarItem(icon: Icon(Icons.help), label: "Помощь"),
      ],
      selectedItemColor: const Color.fromRGBO(54, 86, 249, 1),
      unselectedItemColor: const Color.fromRGBO(190, 196, 251, 1),
      backgroundColor: Colors.black,
      currentIndex: _selectedIndex,
      onTap: _onMenuItemTapped,
      showUnselectedLabels: true,
      iconSize: 30,
      selectedFontSize: 17,
      unselectedFontSize: 17,
    );

    return SafeArea(
        child: Scaffold(
      body: classes[_selectedIndex],
      bottomNavigationBar: menu,
    ));
  }
}

class Cleaners extends StatelessWidget {
  const Cleaners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Icon(Icons.favorite, size: 50, color: Colors.grey.shade600),
      const SizedBox(height: 20),
      Text(
        "Здесь будут клинеры, которые вам понравятся",
        style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
      )
    ]));
  }
}

class Bonuses extends StatelessWidget {
  const Bonuses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image(
            width: MediaQuery.of(context).size.width * 0.8,
            image: const AssetImage("assets/images/bonuses.png")));
  }
}

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
