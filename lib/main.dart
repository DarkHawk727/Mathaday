import 'package:flutter/material.dart';
import 'package:mathaday_app/bottomNavigationBar.dart';
import 'package:mathaday_app/drawer.dart';
import 'home.dart';
import 'profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mathaday',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white)
        )
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  List<Widget> _views = [Home(), Profile()];
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: const Text('Mathaday'),
        backgroundColor: Colors.red[800],
      ),
      drawer: HomeDrawer(),
      body: _views.elementAt(_selectedIndex),
      bottomNavigationBar: HomeNavBar(_onItemTap, _selectedIndex)
    );
  }
}
