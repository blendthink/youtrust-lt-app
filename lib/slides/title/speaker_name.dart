import 'package:flutter/material.dart';

class SpeakerName extends StatelessWidget {
  const SpeakerName({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'Tatsuya Okayama ( blendthink )',
      style: theme.textTheme.labelLarge,
    );
  }
}
