import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/config.dart';
import 'package:youtrust_lt_app/slides/home/current_page.dart';
import 'package:youtrust_lt_app/slides/home/event_name.dart';

class HomeSlide extends StatelessWidget {
  const HomeSlide({
    required this.navigator,
    super.key,
  });

  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    final framePadding = 12 * context.appScale;
    return Scaffold(
      body: Stack(
        children: [
          navigator,
          Positioned(
            bottom: framePadding,
            right: framePadding,
            left: framePadding,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EventName(),
                CurrentPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
