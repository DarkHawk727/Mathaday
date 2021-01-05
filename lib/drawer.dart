import 'package:flutter/material.dart';
import 'package:mathaday_app/userdata.dart';
import 'renderquestion.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[850],
        child: ListView(
          children: <Widget>[] + userData.previousQuestions.reversed.map((e) => Container(
            child: QuestionCard(e),
            height: 400,
          )).toList(),
        ),
      ),
    );
  }
}