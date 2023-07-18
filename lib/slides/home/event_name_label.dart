import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';

class EventNameLabel extends StatelessWidget {
  const EventNameLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScalerText(
      text: 'YOUTRUST x ゆめみ Flutter LT会@渋谷 #2',
      style: theme.textTheme.labelSmall,
    );
  }
}
