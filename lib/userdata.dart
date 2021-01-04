import 'package:flutter/material.dart';
import 'questions.dart';

///im not mark zuckerberg im not stealing ur data lol
class UserData {
  double averageDailyScore = 0.0;
  int questionsCorrect = 0;
  int questionsIncorrect = 0;
  String mostPopularContest = '';
  String leastPopularContest = '';
  int longestStreak = 0;
  String favoriteTopic1 = '';
  String favoriteTopic2 = '';
  List<QuestionData> previousQuestions = [];
}
