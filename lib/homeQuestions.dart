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

  Future<List<Widget>> getCards() async {
    await _generateCards();
    return questionCards;
  }

  _generateCards() async {
    questionCards.clear();
    questions = await _loadData();
    for(QuestionData question in questions) questionCards.add(QuestionCard(question));
  }
}