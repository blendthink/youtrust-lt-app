import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/config.dart';

class ScalerText extends StatelessWidget {
  const ScalerText({
    required this.text,
    required this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textScaleFactor: context.appScale,
    );
  }
}
