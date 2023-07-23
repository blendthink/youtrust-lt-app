import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';

class AgendaHeadline extends StatelessWidget {
  const AgendaHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScalerText(
      text: 'Agenda',
      style: theme.textTheme.headlineLarge,
    );
  }
}
