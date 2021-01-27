import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mathaday_app/userdata.dart';

import 'firebaseuser.dart';
import 'bottomNavigationBar.dart';
import 'drawer.dart';
import 'home.dart';
import 'profile.dart';
import 'loadingScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initSetup(),
      builder: (context, snapshot){
        if (snapshot.hasError) return Text('There was a problem. Try again later');
        if (snapshot.connectionState == ConnectionState.done)
        return MaterialApp(
          home: Main(),
        );
        return Loading();
      },
    );
  }
}

Future<void> initSetup() async {
  await Firebase.initializeApp();
  final firebaseAuth = FirebaseAuth.instance;
  if (firebaseAuth.currentUser == null)
  await FirebaseUser().signInAnonymously();
  userData.getData();
  userData.calculateData();
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
