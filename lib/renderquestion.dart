import 'package:flutter/cupertino.dart';
import 'questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math/flutter_math.dart';
import 'package:flutter_math/tex.dart';

Widget renderShortans(QuestionData question) {
  final eq = Math.tex(question.question,
      textStyle: TextStyle(fontSize: 20, color: Colors.white),
      mathStyle: MathStyle.text);
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[800],
        child: Column(
          children: [
            Expanded(
              child: ListView(children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Math.tex(question.question,
                          textStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                          mathStyle: MathStyle.text),
                    )),
              ]),
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
      ));
}
