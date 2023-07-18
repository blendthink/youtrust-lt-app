import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/router/router.dart';

class CurrentPageObserver extends NavigatorObserver {
  CurrentPageObserver(this.ref);

  final RouterRef ref;

  final _regex = RegExp(r'/(\d+)');

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final location = route.settings.name ?? '';

    final pageIndexString = _regex.firstMatch(location)?.group(1);
    if (pageIndexString == null) {
      throw Exception('Invalid location: $location');
    }

    final pageIndex = int.parse(pageIndexString);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(currentPageNotifierProvider.notifier).update(pageIndex + 1);
    });
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final location = previousRoute?.settings.name ?? '';

    final pageIndexString = _regex.firstMatch(location)?.group(1);
    if (pageIndexString == null) {
      throw Exception('Invalid location: $location');
    }

    final pageIndex = int.parse(pageIndexString);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(currentPageNotifierProvider.notifier).update(pageIndex + 1);
    });
  }
}
