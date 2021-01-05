class QuestionData {
  String question = '';
  String source = '';
  List<String> primaryTopics = [];
  List<String> secondaryTopics = [];
  DateTime completiondate = DateTime.utc(0);
  bool completion = false;
  bool correct = false;

  QuestionData.data(data){
    this.question = data['question'];
    this.source = data['source'];
    this.primaryTopics = data['primaryTopics'];
    this.secondaryTopics = data['secondaryTopics'];
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
  MultipleChoice.data(data) : super.data(data);
}

QuestionData createQuestion(Map<String, dynamic> data){
  if(data.containsKey('options')) return MultipleChoice.data(data);
  return ShortAnswer.data(data);
}