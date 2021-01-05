import 'package:flutter/material.dart';
import 'package:katex_flutter/katex_flutter.dart';

class LaTex extends StatelessWidget {
  LaTex(this.text, {this.style: const TextStyle()});
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: style,
      child: KaTeX(
        delimiter: r'$$',
        laTeXCode: Text(text, style: style),
      )
    );
  }
}