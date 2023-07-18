import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';

class SelfIntroduction extends StatelessWidget {
  const SelfIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const text = '''
おかやまん / blendthink
株式会社ゆめみ
Android・Flutter テックリード
将棋・プログラミング''';
    return Expanded(
      child: ScalerText(
        text: text,
        style: theme.textTheme.bodyLarge?.copyWith(
          height: 2,
        ),
      ),
    );
  }
}
