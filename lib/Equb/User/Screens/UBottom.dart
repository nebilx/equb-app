import 'package:equb_app/Equb/User/Screens/UHome.dart';
import 'package:equb_app/Equb/User/Screens/setting.dart';
import 'package:flutter/material.dart';

class UBottom extends StatefulWidget {
  const UBottom({super.key});

  @override
  State<UBottom> createState() => _UBottomState();
}

class _UBottomState extends State<UBottom> {
  int _index = 0;

  List<Widget> pages = [
    const UHome(),
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.camera),
          //   label: 'Camera',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
