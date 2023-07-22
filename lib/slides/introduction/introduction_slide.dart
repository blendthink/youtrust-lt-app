import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtrust_lt_app/components/scaler_gap.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';
import 'package:youtrust_lt_app/slides/introduction/introduction_background_shader.dart';
import 'package:youtrust_lt_app/slides/introduction/self_introduction.dart';
import 'package:youtrust_lt_app/slides/introduction/speaker_avatar.dart';

class IntroductionSlide extends StatelessWidget {
  const IntroductionSlide({super.key});

  static const path = '/1';

  @override
  Widget build(BuildContext context) {
    const body = Stack(
      children: [
        IntroductionBackgroundShader(),
        Center(
          child: Row(
            children: [
              ScalerGap(36),
              SpeakerAvatar(),
              ScalerGap(36),
              SelfIntroduction(),
            ],
          ),
        ),
      ],
    );

    return Actions(
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
    );
  }
}

class _BackAction extends Action<BackIntent> {
  _BackAction(this.context);

  final BuildContext context;

  @override
  void invoke(BackIntent intent) {
    context.pop();
  }
}

class _NextAction extends Action<NextIntent> {
  _NextAction(this.context);

  final BuildContext context;

  @override
  void invoke(NextIntent intent) {
    // const IntroductionRoute().push(context);
  }
}
