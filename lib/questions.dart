import 'package:mathaday_app/homeQuestions.dart';
import 'package:mathaday_app/userdata.dart';
import 'firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionData {
  String id = '';
  String question = '';
  String source = '';
  int grade = 0;
  List<String> primaryTopics = [];
  List<String> secondaryTopics = [];
  DateTime completiondate = DateTime.utc(0);
  String answer = '';
  bool completion = false;
  bool correct = false;

  bool answered(String response, notify){
    correct = _check(response);
    answer = response;
    completion = true;
    completiondate = DateTime.now();
    _addToPrevious();
    userData.calculateData();
    homeQuestions.remove(this, notify);
    userData.setData();
    return correct;
  }

  bool _check(String response){
    return true;
  }

  void _addToPrevious(){
    userData.previousQuestions.add(this);
  }

  Map<String, dynamic> createMap() {
    return {
    'id': this.id,
    'question': this.question,
    'completion': this.completion,
    'completiondate': this.completiondate,
    'answer': this.answer,
    'correct': this.correct,
    'primaryTopics': this.primaryTopics,
    'secondaryTopics': this.secondaryTopics,
    'source': this.source,
    'grade': this.grade,
    };
  }

  QuestionData.data(data){
    this.id = data['id'] ?? '';
    this.question = data['question'] ?? '';
    this.source = data['source'] ?? '';
    this.primaryTopics = new List<String>.from(data['primaryTopics'] ?? []);
    this.secondaryTopics = new List<String>.from(data['secondaryTopics'] ?? []);
    this.grade = data['grade'] ?? 0;
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
  
  @override
  bool _check(String option){
    return options[option];
  }

  @override
  Map<String, dynamic> createMap() {
    return {
    'id': this.id,
    'question': this.question,
    'completion': this.completion,
    'completiondate': this.completiondate,
    'answer': this.answer,
    'correct': this.correct,
    'primaryTopics': this.primaryTopics,
    'secondaryTopics': this.secondaryTopics,
    'source': this.source,
    'options': this.options,
    'grade': this.grade,
    };
  }
}

QuestionData createQuestion(Map<String, dynamic> data){
  if(data.containsKey('options')) return MultipleChoice.data(data);
  return ShortAnswer.data(data);
}