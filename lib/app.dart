import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtrust_lt_app/router/router.dart';
import 'package:youtrust_lt_app/shortcuts/app_shortcuts.dart';
import 'package:youtrust_lt_app/theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      shortcuts: appShortcuts,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
