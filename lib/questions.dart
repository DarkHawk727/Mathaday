class QuestionData {
  String question = '';
  String source = '';
  List<String> primaryTopic = [];
  List<String> secondaryTopic = [];
  QuestionData(this.question);
  DateTime completiondate = DateTime.utc(0);
  bool completion = false;
  bool correct = false;
}

class ShortAnswer extends QuestionData {
  ShortAnswer(String question) : super(question);
}
