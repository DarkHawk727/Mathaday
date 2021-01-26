import 'package:firebase_auth/firebase_auth.dart';

import 'questions.dart';
import 'package:intl/intl.dart';
import 'firestore.dart';

///im not mark zuckerberg im not stealing ur data lol
class UserData {
  double averageDailyScore = 0.0;
  double percentagecorrect = 0.0;
  int questionsCorrect = 0;
  int questionsIncorrect = 0;
  Map<String, int> contests = {};
  int longestStreak = 0;
  String favoriteTopic1 = '';
  String favoriteTopic2 = '';
  double xp = 0.0;
  List<QuestionData> previousQuestions = [];
  Map<String, int> streak = {};

  Future<void> getData() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    Map<String, dynamic> data = await Database().getUserData(firebaseAuth.currentUser);
    userData.averageDailyScore = data['averageDailyScore'];
    userData.percentagecorrect = data['percentageCorrect'];
    print(userData.percentagecorrect);
    userData.contests = new Map<String, int>.from(data['contests']);
  }

  Future<void> setData() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    Database().setData({
      'contests': userData.contests,
      'percentageCorrect': userData.percentagecorrect,
      'averageDailyScore': userData.averageDailyScore
    }, 'users', firebaseAuth.currentUser.uid);
  }

  void calculateData() {
    _calculateAverageDailyScore();
    _calculateCorrectIncorrect();
    _calculatePercentageCorrect();
    _calculateContests();
    _calculateStreak();
  }

  void _calculateAverageDailyScore() {}

  void _calculatePercentageCorrect() {
    if(previousQuestions.length > 0)
    percentagecorrect = questionsCorrect / (questionsCorrect + questionsIncorrect) * 100;
  }

  void _calculateCorrectIncorrect(){
    questionsCorrect = previousQuestions.where((e) => e.correct).toList().length;
    questionsIncorrect = previousQuestions.length - questionsCorrect;
  }

  void _calculateContests(){
    contests = {};
    previousQuestions.where((e) => e.correct).toList().forEach((question) {
      if(contests.containsKey(question.source)){
        contests[question.source]++;
      } else {
        contests[question.source] = 1;
      }
    });
  }

  void _calculateStreak(){
    DateFormat _format = DateFormat('yyyy-MM-dd');
    for(int i = 6; i >= 0; i--) streak[_format.format(DateTime.now().subtract(Duration(days: i))).toString()] = 0;
    int i = 0;
    while(previousQuestions.length > i && previousQuestions[i].completiondate.compareTo(DateTime.now().subtract(Duration(days:7))) >= 0){
      streak[_format.format(previousQuestions[i].completiondate)] += 1;
      i++;
    }
    print(streak);
  }
}

UserData userData = UserData();

