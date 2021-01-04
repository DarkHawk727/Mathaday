import 'package:flutter/material.dart';
import 'questions.dart';
import 'renderquestion.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var examples = [
    new ShortAnswer(
        r'$ If $ (2^4)(3^6)=9(6^x) $, what is the value of $ x $ ? $'),
    new ShortAnswer(
        r'$ If $ 2x^2=9x-4 $ and $ x $ then the value of $ 2x $ is? $')
  ];
  List<Widget> exampleCards = [];

  void initState() {
    super.initState();
    setupCards();
  }

  void setupCards() {
    setState(() {
      for (ShortAnswer example in examples) {
        exampleCards.add(QuestionCard(example));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: PageView(children: exampleCards),
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
