import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';

class SpeakerNameLabel extends StatelessWidget {
  const SpeakerNameLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScalerText(
      text: '@blendthink',
      style: theme.textTheme.labelLarge,
    );
  }
}
