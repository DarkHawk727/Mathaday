import 'package:flutter/material.dart';
import 'homeQuestions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeQuestions _homeQuestions = HomeQuestions();
  List<Widget> _questionCards = [];

  void initState() {
    super.initState();
    setupCards();
  }

  setupCards() async {
    _questionCards = await _homeQuestions.getCards();
    setState(() => _questionCards);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: PageView(children: _questionCards),
          height: 350,
        ),
        MaterialButton(
          onPressed: (){},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('New Questions', style: TextStyle(color: Colors.white)),
              Icon(Icons.casino_outlined, color: Colors.white)
            ]
          )
        )
      ],
    );
  }
}
