class QuestionData {
  String question = '';
  String source = '';
  int grade = 0;
  List<String> primaryTopics = [];
  List<String> secondaryTopics = [];
  DateTime completiondate = DateTime.utc(0);
  bool completion = false;
  bool correct = false;

  bool check(String response){
    return true;
  }

  QuestionData.data(data){
    this.question = data['question'];
    this.source = data['source'];
    this.primaryTopics = data['primaryTopics'];
    this.secondaryTopics = data['secondaryTopics'];
    this.grade = data['grade'];
  }
  QuestionData(this.question);
}

class ShortAnswer extends QuestionData {
  ShortAnswer(String question) : super(question);
  ShortAnswer.data(data) : super.data(data);
}

class MultipleChoice extends QuestionData {
  Map<String, bool> options = {};
  MultipleChoice(String question) : super(question);
  MultipleChoice.data(data) : 
    options = Map<String, bool>.from(data['options']),
    super.data(data);
  
  bool check(String option){
    print(options[option]);
    return options[option];
  }
}

QuestionData createQuestion(Map<String, dynamic> data){
  if(data.containsKey('options')) return MultipleChoice.data(data);
  return ShortAnswer.data(data);
}