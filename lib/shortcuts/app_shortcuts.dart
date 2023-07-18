import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';

const appShortcuts = <ShortcutActivator, Intent>{
  _backActivator: BackIntent(),
  _nextActivator: NextIntent(),
};

const _backActivator = SingleActivator(
  LogicalKeyboardKey.arrowLeft,
  meta: true,
);

const _nextActivator = SingleActivator(
  LogicalKeyboardKey.arrowRight,
  meta: true,
);
