import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';

class SpeakerName extends StatelessWidget {
  const SpeakerName({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScalerText(
      text: 'Tatsuya Okayama ( blendthink )',
      style: theme.textTheme.labelLarge,
    );
  }
}
