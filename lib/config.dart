import 'package:flutter/material.dart';

const double _appDefaultWidth = 640;
const double _appDefaultHeight = _appDefaultWidth / 16 * 9;

const appDefaultSize = Size(
  _appDefaultWidth,
  _appDefaultHeight,
);

extension AppScale on BuildContext {
  double get appScale {
    final height = MediaQuery.sizeOf(this).height;
    return height / _appDefaultHeight;
  }
}
