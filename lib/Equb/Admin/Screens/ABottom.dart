import 'package:equb_app/Equb/Admin/Screens/AHome.dart';
import 'package:equb_app/Equb/Admin/Screens/Addequb.dart';
import 'package:equb_app/Equb/User/Screens/UHome.dart';
import 'package:equb_app/Equb/User/Screens/setting.dart';
import 'package:flutter/material.dart';

class ABottom extends StatefulWidget {
  const ABottom({super.key});

  @override
  State<ABottom> createState() => _ABottomState();
}

class _ABottomState extends State<ABottom> {
  int _index = 0;

  List<Widget> pages = [
    const AHome(),
    AddEqub(),
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
            icon: Icon(Icons.add),
            label: 'Add',
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
