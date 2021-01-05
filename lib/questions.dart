import 'package:mathaday_app/homeQuestions.dart';
import 'package:mathaday_app/userdata.dart';

class QuestionData {
  String question = '';
  String source = '';
  int grade = 0;
  List<String> primaryTopics = [];
  List<String> secondaryTopics = [];
  DateTime completiondate = DateTime.utc(0);
  bool completion = false;
  bool correct = false;

  bool answered(String answer, notify){
    correct = _check(answer);
    completion = true;
    _addToPrevious();
    homeQuestions.remove(this, notify);
    return correct;
  }

  bool _check(String answer){
    return true;
  }

  void _addToPrevious(){
    userData.previousQuestions.add(this);
  }

  QuestionData.data(data){
    this.question = data['question'];
    this.source = data['source'];
    this.primaryTopics = data['primaryTopics'];
    this.secondaryTopics = data['secondaryTopics'];
    this.grade = data['grade'];
  }
}

class ShortAnswer extends QuestionData {
  ShortAnswer.data(data) : super.data(data);
}

class MultipleChoice extends QuestionData {
  Map<String, bool> options = {};
  MultipleChoice.data(data) : 
    options = Map<String, bool>.from(data['options']),
    super.data(data);
  
  bool _check(String option){
    return options[option];
  }
}

QuestionData createQuestion(Map<String, dynamic> data){
  if(data.containsKey('options')) return MultipleChoice.data(data);
  return ShortAnswer.data(data);
}