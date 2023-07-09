import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';

const appShortcuts = <ShortcutActivator, Intent>{
  _backPageActivator: BackPageIntent(),
  _nextPageActivator: NextPageIntent(),
};

const _backPageActivator = SingleActivator(
  LogicalKeyboardKey.arrowLeft,
  meta: true,
);

const _nextPageActivator = SingleActivator(
  LogicalKeyboardKey.arrowRight,
  meta: true,
);
