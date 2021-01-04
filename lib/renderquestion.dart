import 'package:flutter/material.dart';
import 'questions.dart';
import 'latex.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard(this.question);
  final QuestionData question;

  @override
  _QuestionCardState createState() => _QuestionCardState(question);
}

class _QuestionCardState extends State<QuestionCard> {
  _QuestionCardState(this.question);
  final QuestionData question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[800],
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: LaTex(
                        question.question, 
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                        )
                      )
                    )
                  ),
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Source: ' + question.source,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      )
    );
  }
}