// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'f93deb3d42bb7607b66aa4e80ca4574fbad2713c';

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
String _$currentPageNotifierHash() =>
    r'058fe74528c6e0b768463ace5613f10391d93881';

/// See also [CurrentPageNotifier].
@ProviderFor(CurrentPageNotifier)
final currentPageNotifierProvider =
    AutoDisposeNotifierProvider<CurrentPageNotifier, int>.internal(
  CurrentPageNotifier.new,
  name: r'currentPageNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentPageNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentPageNotifier = AutoDisposeNotifier<int>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
