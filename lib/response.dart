import 'package:flutter/material.dart';
import 'questions.dart';

class Response extends StatefulWidget {
  @override
  _ResponseState createState() => _ResponseState();
}

class _ResponseState extends State<Response> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
  List<Widget> optionWidgets = [];

  @override
  void initState(){
    super.initState();

  }

  _setOptionWidgets(){
    question.options.forEach((key, value) {
      optionWidgets.add(
        
      );
    });
  }

  Widget _createOptionWidget(String option){
    return RaisedButton(
      
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      
    );
  }
}
