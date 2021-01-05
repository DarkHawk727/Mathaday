import 'package:flutter/material.dart';
import 'package:mathaday_app/latex.dart';
import 'questions.dart';

class Response extends StatefulWidget {
  Response(this.question);
  final QuestionData question;

  @override
  _ResponseState createState() => _ResponseState(question);
}

class _ResponseState extends State<Response> {
  _ResponseState(this.question);
  final QuestionData question;

  @override
  Widget build(BuildContext context) {
    if(question is MultipleChoice) return MultipleChoiceResponse(question);
    return Container(child: TextField());
  }
}

class MultipleChoiceResponse extends StatefulWidget {
  MultipleChoiceResponse(this.question);
  final MultipleChoice question;

  @override
  _MultipleChoiceResponseState createState() => _MultipleChoiceResponseState(question);
}

class _MultipleChoiceResponseState extends State<MultipleChoiceResponse> {
  _MultipleChoiceResponseState(this.question);
  final MultipleChoice question;
  List<Widget> _optionWidgets = [];

  @override
  void initState(){
    super.initState();
    _setOptionWidgets();
  }

  _setOptionWidgets(){
    setState(() {
      question.options.entries.forEach((option) {
        _optionWidgets.add(_createOptionWidget(option.key));
      });
    });
  }

  Widget _createOptionWidget(String option){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: () => question.check(option),
        child: LaTex(option),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _optionWidgets,
    );
  }
}
