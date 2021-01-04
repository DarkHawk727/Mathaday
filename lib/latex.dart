import 'package:flutter/material.dart';
import 'package:katex_flutter/katex_flutter.dart';

class LaTex extends StatelessWidget {
  LaTex(this.text, {this.style});
  final String text;
  final TextStyle style;

  String processText(String text){
    return (r'$ ' + text + r' $');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: style ?? TextStyle(),
      child: KaTeX(
        laTeXCode: Text(processText(text), style: style ?? TextStyle()),
      )
    );
  }
}