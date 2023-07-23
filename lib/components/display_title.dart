import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';

class DisplayTitle extends StatelessWidget {
  const DisplayTitle(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScalerText(
      text: text,
      style: theme.textTheme.displaySmall,
    );
  }
}
