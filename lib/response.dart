import 'package:flutter/material.dart';
import 'package:mathaday_app/latex.dart';
import 'questions.dart';

class Response extends StatefulWidget {
  Response(this.question, this.notify);
  final QuestionData question;
  final Function notify;

  @override
  _ResponseState createState() => _ResponseState(question, notify);
}

class _ResponseState extends State<Response> {
  _ResponseState(this.question, this.notify);
  final QuestionData question;
  final Function notify;

  @override
  Widget build(BuildContext context) {
    if(question is MultipleChoice) return MultipleChoiceResponse(question, notify);
    return Container(child: TextField());
  }
}

class MultipleChoiceResponse extends StatefulWidget {
  MultipleChoiceResponse(this.question, this.notify);
  final MultipleChoice question;
  final Function notify;

  @override
  _MultipleChoiceResponseState createState() => _MultipleChoiceResponseState(question, notify);
}

class _MultipleChoiceResponseState extends State<MultipleChoiceResponse> {
  _MultipleChoiceResponseState(this.question, this.notify);
  final MultipleChoice question;
  final Function notify;
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
    Color buttonColor = question.completion ? (question.options[option] ? Colors.green : Colors.red) : Colors.white;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        color: buttonColor,
        colorBrightness: Brightness.light,
        onPressed: (){
          if(!question.completion)
          question.answered(option, notify);
        },
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
