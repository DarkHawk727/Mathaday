import 'package:mathaday_app/userdata.dart';

import 'questions.dart';
import 'renderquestion.dart';
import 'firestore.dart';
import 'package:flutter/material.dart';

class HomeQuestions{
  List<QuestionData> questions = [];
  List<Widget> questionCards = [];

  Future<List<QuestionData>> _loadData() async {
    var db = Database();
    var _questions = await db.getAllQuestions();
    return _questions.map((e) => createQuestion(e)).toList();
  }

  getCards(Function notify) async {
    this.questions = await _loadData();
    questions.removeWhere((e) => userData.previousQuestions.where((e1) => e1.correct).map((e2) => e2.id).contains(e.id));
    _cardsFromData(notify);
  }

  _cardsFromData(notify){
    this.questionCards.clear();
    for(QuestionData question in questions) this.questionCards.add(QuestionCard(question, notify));
    notify();
  }

  add(List<QuestionData> questions){
    questions.addAll(questions);
  }

  remove(QuestionData question, Function notify){
    questions.remove(question);
    _cardsFromData(notify);
  }
}

HomeQuestions homeQuestions = HomeQuestions();
