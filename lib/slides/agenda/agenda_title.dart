import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';

class AgendaTitle extends StatelessWidget {
  const AgendaTitle(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScalerText(
      text: title,
      style: theme.textTheme.titleLarge,
    );
  }
}
