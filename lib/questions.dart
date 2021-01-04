class QuestionData {
  String question = '';
  String source = '';
  List<String> primaryTopic = [];
  List<String> secondaryTopic = [];
  DateTime completiondate = DateTime.utc(0);
  bool completion = false;
  bool correct = false;

  QuestionData(this.question);
}

class ShortAnswer extends QuestionData {
  ShortAnswer(String question) : super(question);
}

class MultipleChoice extends QuestionData {
  Map<String, bool> options = {};
  MultipleChoice(String question) : super(question);
}
