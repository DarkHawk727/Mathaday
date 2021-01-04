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
        r'\begin{aligned}\text{If } (2^4)(3^6)=9(6^x) \text{, what is the value }\\ \text{of } x\text{?} \end{aligned}'),
    new ShortAnswer(
        r'\text{If }2x^2=9x-4 \text{ and } x\ne4 \text{ then the value of }2x \text{ is?}')
  ];
  List<Widget> exampleCards = [];

  void initState() {
    super.initState();
    setupCards();
  }

  void setupCards() {
    setState(() {
      for (ShortAnswer example in examples) {
        exampleCards.add(renderShortans(example));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(children: exampleCards),
      height: 350,
    );
  }
}
