import 'package:equb_app/Equb/Finance/Screens/FHome.dart';
import 'package:equb_app/Equb/User/Screens/setting.dart';
import 'package:flutter/material.dart';

class FBottom extends StatefulWidget {
  const FBottom({super.key});

  @override
  State<FBottom> createState() => _FBottomState();
}

class _FBottomState extends State<FBottom> {
  int _index = 0;

  List<Widget> pages = [
    const FHome(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        iconSize: 28,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
