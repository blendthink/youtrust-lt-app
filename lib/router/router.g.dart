// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $titleRoute,
      $introductionRoute,
    ];

RouteBase get $titleRoute => GoRouteData.$route(
      path: '/',
      factory: $TitleRouteExtension._fromState,
    );

extension $TitleRouteExtension on TitleRoute {
  static TitleRoute _fromState(GoRouterState state) => const TitleRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $introductionRoute => GoRouteData.$route(
      path: '/1',
      factory: $IntroductionRouteExtension._fromState,
    );

extension $IntroductionRouteExtension on IntroductionRoute {
  static IntroductionRoute _fromState(GoRouterState state) =>
      const IntroductionRoute();

  String get location => GoRouteData.$location(
        '/1',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'6e0e8cc72835418fa80604eaeec9f9445786c67b';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
