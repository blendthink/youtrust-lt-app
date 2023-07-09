import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtrust_lt_app/slides/introduction_slide.dart';
import 'package:youtrust_lt_app/slides/title_slide.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) => GoRouter(
      routes: $appRoutes,
    );

@TypedGoRoute<TitleRoute>(
  path: '/',
)
class TitleRoute extends GoRouteData {
  const TitleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TitleSlide();
}

@TypedGoRoute<IntroductionRoute>(
  path: '/1',
)
class IntroductionRoute extends GoRouteData {
  const IntroductionRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const IntroductionSlide();
}
