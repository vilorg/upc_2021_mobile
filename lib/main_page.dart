import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    var menu = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.cleaning_services), label: "Заказы"),
        BottomNavigationBarItem(
            icon: Icon(Icons.cleaning_services), label: "Клинеры"),
        BottomNavigationBarItem(
            icon: Icon(Icons.cleaning_services), label: "Бонусы"),
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
          body: Text("hktrgkjth"),
          bottomNavigationBar: menu,
        ));
  }
}
