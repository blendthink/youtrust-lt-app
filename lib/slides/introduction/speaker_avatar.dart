import 'package:flutter/material.dart';
import 'package:youtrust_lt_app/config.dart';

class SpeakerAvatar extends StatelessWidget {
  const SpeakerAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 120 * context.appScale,
      backgroundImage: const AssetImage('assets/speaker.png'),
    );
  }
}
