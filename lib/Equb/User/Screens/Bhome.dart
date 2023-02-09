import 'package:equb_app/Home/screen/home.dart';
import 'package:equb_app/Home/screen/setting.dart';
import 'package:flutter/material.dart';

class BHome extends StatefulWidget {
  const BHome({super.key});

  @override
  State<BHome> createState() => _BHomeState();
}

class _BHomeState extends State<BHome> {
  int _index = 0;

  List<Widget> pages = [
    const Home(),
    const Center(
      child: Text('cart screen'),
    ),
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
            icon: Icon(Icons.camera),
            label: 'Camera',
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
