import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtrust_lt_app/components/scaler_gap.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';
import 'package:youtrust_lt_app/slides/title/speaker_name_label.dart';
import 'package:youtrust_lt_app/slides/title/title_background_shader.dart';
import 'package:youtrust_lt_app/slides/title/title_shader.dart';

class TitleSlide extends StatelessWidget {
  const TitleSlide({super.key});

  static const path = '/0';

  @override
  Widget build(BuildContext context) {
    const body = Stack(
      children: [
        TitleBackgroundShader(),
        Row(
          children: [
            ScalerGap(36),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScalerGap(36),
                TitleShader(),
                ScalerGap(12),
                SpeakerNameLabel(),
              ],
            ),
          ],
        ),
      ],
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Actions(
        actions: <Type, Action<Intent>>{
          BackIntent: _BackAction(context),
          NextIntent: _NextAction(context),
        },
        child: const Focus(
          autofocus: true,
          child: Scaffold(
            body: body,
          ),
        ),
      ),
    );
  }
}

class _BackAction extends Action<BackIntent> {
  _BackAction(this.context);

  final BuildContext context;

  @override
  void invoke(BackIntent intent) {}
}

class _NextAction extends Action<NextIntent> {
  _NextAction(this.context);

  final BuildContext context;

  @override
  void invoke(NextIntent intent) {
    context.push('/1');
  }
}
