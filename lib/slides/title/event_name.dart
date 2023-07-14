import 'package:flutter/material.dart';

class EventName extends StatelessWidget {
  const EventName({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'YOUTRUST x ゆめみ Flutter LT会@渋谷 #2',
      style: theme.textTheme.bodySmall,
    );
  }
}
