import 'package:flutter/material.dart';
import 'package:mathaday_app/questions.dart';
import 'renderquestion.dart';
import 'homeQuestions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void initState() {
    super.initState();
    update();
    setupCards();
  }

  setupCards() async {
    //if(homeQuestions.questions.isEmpty)
    await homeQuestions.getCards(update);
  }

  update(){
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Container(
          height: 350,
          child: (homeQuestions.questions.isNotEmpty) ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeQuestions.questions.length,
            itemBuilder: (BuildContext builder, int index){
              QuestionData question = homeQuestions.questions[index];
              return Dismissible(
                direction: DismissDirection.vertical,
                onDismissed: (_) => homeQuestions.remove(question, update),
                key: Key(question.question),
                child: Container(
                  width: width,
                  child: QuestionCard(question, update)
                )
              );
            },
          ) : Center(child: Text("Looks like you've reached the end", style: TextStyle(color: Colors.white, fontSize: 20),))
        ),
        MaterialButton(
          onPressed: setupCards,
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