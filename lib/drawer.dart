import 'package:flutter/material.dart';
import 'package:mathaday_app/userdata.dart';
import 'renderquestion.dart';

class HomeDrawer extends StatelessWidget {
  update(){
    //setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[850],
        child: ListView(
          children: <Widget>[] + userData.previousQuestions.where((e) => e.correct).toList().reversed.map((e) => Container(
            child: QuestionCard(e, update),
            height: 400,
          )).toList(),
        ),
      ),
    );
  }
}