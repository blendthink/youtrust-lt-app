import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';
import 'package:youtrust_lt_app/router/router.dart';

class CurrentPage extends ConsumerWidget {
  const CurrentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(currentPageNotifierProvider);
    final theme = Theme.of(context);
    return ScalerText(
      text: '$page',
      style: theme.textTheme.labelSmall,
    );
  }
}
