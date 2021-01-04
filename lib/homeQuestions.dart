import 'questions.dart';
import 'renderquestion.dart';
import 'package:flutter/material.dart';

import 'renderquestion.dart';

class HomeQuestions{
  List<ShortAnswer> questions = [
    new ShortAnswer(
        r'$ If $ (2^4)(3^6)=9(6^x) $, what is the value of $ x $ ? $'),
    new ShortAnswer(
        r'$ If $ 2x^2=9x-4 $ and $ x $ then the value of $ 2x $ is? $')
  ];
  List<Widget> questionCards = [];

  List<Widget> getCards(){
    _generateCards();
    return questionCards;
  }

  _generateCards(){
    questionCards.clear();
    for(QuestionData question in questions) questionCards.add(QuestionCard(question));
  }
}