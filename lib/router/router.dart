import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtrust_lt_app/slides/home/home_slide.dart';
import 'package:youtrust_lt_app/router/current_page_observer.dart';
import 'package:youtrust_lt_app/slides/introduction/introduction_slide.dart';
import 'package:youtrust_lt_app/slides/title/title_slide.dart';

part 'router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final slideRoutes = [
  GoRoute(
    path: TitleSlide.path,
    builder: (context, state) => const TitleSlide(),
  ),
  GoRoute(
    path: IntroductionSlide.path,
    builder: (context, state) => const IntroductionSlide(),
  ),
];

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: TitleSlide.path,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        parentNavigatorKey: rootNavigatorKey,
        routes: slideRoutes,
        observers: [
          CurrentPageObserver(ref),
        ],
        builder: (context, state, navigator) => HomeSlide(navigator: navigator),
      ),
    ],
  );
}

@riverpod
class CurrentPageNotifier extends _$CurrentPageNotifier {
  @override
  int build() => 1;

  void update(int page) {
    state = page;
  }
}
