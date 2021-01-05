import 'package:flutter/material.dart';
import 'renderquestion.dart';
import 'homeQuestions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void initState() {
    super.initState();
    setupCards();
  }

  setupCards() async {
    await homeQuestions.getCards(update);
  }

  update(){
    setState(() => homeQuestions.questions);
    setState(() {
      
    });
    print(homeQuestions.questions.map((e) => e.question));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Container(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeQuestions.questions.length,
            itemBuilder: (BuildContext builder, int index){
              return Dismissible(
                direction: DismissDirection.vertical,
                key: Key(homeQuestions.questions[index].question),
                child: Container(
                  width: width,
                  child: QuestionCard(homeQuestions.questions[index], update)
                )
              );
            },
          ),
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
