import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:youtrust_lt_app/config.dart';

class ScalerGap extends StatelessWidget {
  const ScalerGap(this.mainAxisExtent, {super.key});

  final double mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return Gap(mainAxisExtent * context.appScale);
  }
}
