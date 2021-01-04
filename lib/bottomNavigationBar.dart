import 'package:flutter/material.dart';

class HomeNavBar extends StatelessWidget {
  HomeNavBar(this._onItemTap,this._selectedIndex);
  final int _selectedIndex;
  final Function _onItemTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.red[800],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Colors.red),
        ],
      );
  }
}