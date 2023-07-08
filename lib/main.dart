import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_size/window_size.dart';
import 'package:youtrust_lt_app/app.dart';

void main() {
  if (!Platform.isMacOS) {
    throw Exception('Supported platforms are MacOS only');
  }

  WidgetsFlutterBinding.ensureInitialized();

  const double width = 1280;
  const double height = width / 16 * 9;
  setWindowMinSize(const Size(width, height));

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
